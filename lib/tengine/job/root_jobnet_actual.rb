# -*- coding: utf-8 -*-
require 'tengine/job'

# 実行時のルートジョブネットを表すVertex
class Tengine::Job::RootJobnetActual < Tengine::Job::JobnetActual
  include Tengine::Job::Root

  belongs_to :template, :inverse_of => :root_jobnet_actuals, :index => true, :class_name => "Tengine::Job::RootJobnetTemplate"
  has_many :executions, :inverse_of => :root_jobnet, :class_name => "Tengine::Job::Execution"

  field :locking_vertex_id, :type => String                 # ロックを必要とするvertexのID(ルートジョブネット自身を指すこともあり得る)
  field :lock_key         , :type => String, :default => "" # ロックのキー
  field :lock_timeout_key , :type => String                 # ロック解放待ちでタイムアウトした際に発火するイベントのキー

  def rerun(*args)
    options = args.extract_options!
    sender = options.delete(:sender) || Tengine::Event.default_sender
    options = options.merge({
        :retry => true,
        :root_jobnet_id => self.id,
      })
    result = Tengine::Job::Execution.new(options)
    result.target_actual_ids ||= []
    result.target_actual_ids += args.flatten
    result.save!
    sender.wait_for_connection do
      sender.fire(:'start.execution.job.tengine', :properties => {
          :execution_id => result.id.to_s
        })
    end
    result
  end

  def acquire_lock(vertex)
    self.locking_vertex_id = vertex.id.to_s
    self.lock_key = "#{Process.pid.to_s}/#{vertex.id.to_s}"
    self.lock_timeout_key = "#{self.lock_key}-#{Time.now.utc.iso8601}"
  end

end
