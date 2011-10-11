# -*- coding: utf-8 -*-
require 'tengine/job'

# ジョブとして実際にスクリプトを実行する処理をまとめるモジュール。
# Tengine::Job::JobnetActualと、Tengine::Job::ScriptActualがincludeします
module Tengine::Job::ScriptExecutable
  def run
    pid = execute
    # ack(pid)
  end

  def execute
    cmd = build_command
    
  end

  def build_user_command(job)
    result = []
    # RubyのNet::SSHでは設定ファイルが読み込まれないので、ロードするようにします。
    # ~/.bash_profile, ~/.bashrc などは非対応。
    # ファイルが存在していたらsourceで読み込むようにしたいのですが、一旦保留します。
    # http://www.syns.net/10/
    result << "source /etc/profile"
    mm_env = build_mm_env(job).map{|k,v| "#{k}=#{v}"}.join(" ")
    # Hadoopジョブの場合は環境変数をセットする
    if job.job_type_key == :hadoop_job_run
      mm_env << ' ' << Job::HadoopJob.new(job).hadoop_opts_msg
    end
    result << "export #{mm_env}"
    unless @actual_schedule.preparation_command.blank?
      result << @actual_schedule.preparation_command
    end
    # cmdはユーザーが設定したスクリプトを組み立てたもので、
    # プロセスの監視／強制停止のためにmm_system_agent/bin/mm-system-agent-run
    # からこれらを実行させるためにはcmdを編集します。
    # mm-system-agent-runは、標準出力に監視対象となる起動したプロセスのPIDを出力します。
    runner_path = ENV["MM_RUNNER_PATH"] || "mm-system-agent-run"
    runner_option = ""
    runner_option << " --stdout" if @actual_schedule.keeping_stdout
    runner_option << " --stderr" if @actual_schedule.keeping_stderr
    script = "#{runner_path}#{runner_option} -- #{job.script}" # runnerのオプションを指定する際は -- の前に設定してください
    unless job.parameters.blank?
      script << " " << job.parameters
    end
    result << script
    result.join(" && ")
  end

  # MMから実行されるシェルスクリプトに渡す環境変数のHashを返します。
  # MM_ACTUAL_JOB_ID                : 実行される末端のジョブのMM上でのID
  # MM_ACTUAL_JOB_ANCESTOR_IDS      : 実行される末端のジョブの祖先のMM上でのIDをセミコロンで繋げた文字列 (テンプレートジョブ単位)
  # MM_FULL_ACTUAL_JOB_ANCESTOR_IDS : 実行される末端のジョブの祖先のMM上でのIDをセミコロンで繋げた文字列 (expansionから展開した単位)
  # MM_ACTUAL_JOB_NAME_PATH         : 実行される末端のジョブのname_path
  # MM_ACTUAL_JOB_SECURITY_TOKEN    : 公開API呼び出しのためのセキュリティ用のワンタイムトークン
  # MM_TEMPLATE_JOB_ID              : テンプレートジョブ(=実行される末端のジョブの元となったジョブ)のID
  # MM_TEMPLATE_JOB_ANCESTOR_IDS    : テンプレートジョブの祖先のMM上でのIDをセミコロンで繋げたもの
  # MM_SCHEDULE_ID                  : 実行スケジュールのID
  # MM_SCHEDULE_ESTIMATED_TIME      : 実行スケジュールの見積り時間。単位は分。
  # MM_SCHEDULE_ESTIMATED_END       : 実行スケジュールの見積り終了時刻をYYYYMMDDHHMMSS式で。(できればISO 8601など、タイムゾーンも表現できる標準的な形式の方が良い？)
  # MM_MASTER_SCHEDULE_ID           : マスタースケジュールがあればそのID。マスタースケジュールがない場合は環境変数は指定されません。
  #
  # 未実装
  # MM_FAILED_JOB_ID                : ジョブが失敗した場合にrecoverやfinally内のジョブを実行時に設定される、失敗したジョブのMM上でのID。
  # MM_FAILED_JOB_ANCESTOR_IDS      : ジョブが失敗した場合にrecoverやfinally内のジョブを実行時に設定される、失敗したジョブの祖先のMM上でのIDをセミコロンで繋げた文字列。
  def build_mm_env(job)
    result = {
      "MM_ACTUAL_JOB_ID" => job.id.to_s,
      "MM_ACTUAL_JOB_ANCESTOR_IDS" => '"%s"' % job.ancestors_until_expansion.map(&:id_string).join(';'),
      "MM_FULL_ACTUAL_JOB_ANCESTOR_IDS" => '"%s"' % job.ancestors.map(&:id_string).join(';'),
      "MM_ACTUAL_JOB_NAME_PATH" => job.name_path.dump,
      "MM_ACTUAL_JOB_SECURITY_TOKEN" => "", # TODO トークンの生成
      "MM_SCHEDULE_ID" => @actual_schedule.id_string,
      "MM_SCHEDULE_ESTIMATED_TIME" => @actual_schedule.estimated_time,
    }
    if estimated_end = @actual_schedule.actual_estimated_end
      result["MM_SCHEDULE_ESTIMATED_END"] = @actual_schedule.actual_estimated_end.strftime("%Y%m%d%H%M%S")
    end
    if t = job.template_job
      result.update({
          "MM_TEMPLATE_JOB_ID" => t.id.to_s,
          "MM_TEMPLATE_JOB_ANCESTOR_IDS" => '"%s"' % t.ancestors.map(&:id_string).join(';'),
      })
    end
    if ms = @actual_schedule.master_schedule
      result.update({
          "MM_MASTER_SCHEDULE_ID" => ms.id.to_s,
      })
    end
    result
  end

end