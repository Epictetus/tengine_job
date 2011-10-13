# -*- coding: utf-8 -*-
require 'spec_helper'
require 'tengine/rspec'

describe 'job_control_driver' do
  include Tengine::RSpec::Extension

  target_dsl File.expand_path("../../../../lib/tengine/job/drivers/job_control_driver.rb", File.dirname(__FILE__))
  driver :job_control_driver

  context "rjn0001" do
    before do
      Tengine::Job::Vertex.delete_all
      builder = Rjn0001SimpleJobnetBuilder.new
      @jobnet = builder.create_actual
      @ctx = builder.context
      @execution = Tengine::Job::Execution.create!({
          :root_jobnet_id => @jobnet.id,
        })
    end

    it "最初のリクエスト" do
      tengine.should_not_fire
      mock_ssh = mock(:ssh)
      mock_channel = mock(:channel)
      Net::SSH.should_receive(:start).
        with("184.72.20.1", "goku", :password => "dragonball").and_yield(mock_ssh)
      mock_ssh.should_receive(:open_channel).and_yield(mock_channel)
      mock_channel.should_receive(:exec) do |*args|
        args.length.should == 1
        # args.first.should =~ %r<source \/etc\/profile && export MM_ACTUAL_JOB_ID=[0-9a-f]{24} MM_ACTUAL_JOB_ANCESTOR_IDS=\\"[0-9a-f]{24}\\" MM_FULL_ACTUAL_JOB_ANCESTOR_IDS=\\"[0-9a-f]{24}\\" MM_ACTUAL_JOB_NAME_PATH=\\"/rjn0001/j11\\" MM_ACTUAL_JOB_SECURITY_TOKEN= MM_SCHEDULE_ID=[0-9a-f]{24} MM_SCHEDULE_ESTIMATED_TIME= MM_TEMPLATE_JOB_ID=[0-9a-f]{24} MM_TEMPLATE_JOB_ANCESTOR_IDS=\\"[0-9a-f]{24}\\" && tengine_job_agent_run -- \$HOME/j11\.sh>
        args.first.should =~ %r<source \/etc\/profile>
        args.first.should =~ %r<MM_ACTUAL_JOB_ID=[0-9a-f]{24} MM_ACTUAL_JOB_ANCESTOR_IDS=\"[0-9a-f]{24}\" MM_FULL_ACTUAL_JOB_ANCESTOR_IDS=\"[0-9a-f]{24}\" MM_ACTUAL_JOB_NAME_PATH=\"/rjn0001/j11\" MM_ACTUAL_JOB_SECURITY_TOKEN= MM_SCHEDULE_ID=[0-9a-f]{24} MM_SCHEDULE_ESTIMATED_TIME= MM_TEMPLATE_JOB_ID=[0-9a-f]{24} MM_TEMPLATE_JOB_ANCESTOR_IDS=\"[0-9a-f]{24}\">
        args.first.should =~ %r<\$HOME\/j11\.sh>
      end
      tengine.receive("start.job.tengine", :properties => {
          :execution_id => @execution.id.to_s,
          :root_jobnet_id => @jobnet.id.to_s,
          :target_jobnet_id => @jobnet.id.to_s,
        })
    end

    if ENV['PASSWORD']
    context "実際にSSHで接続", :ssh_actual => true do
      before do
        resource_fixture = GokuAtEc2ApNortheast.new
        credential = resource_fixture.goku_ssh_pw
        credential.auth_values = {:username => ENV['USER'], :password => ENV['PASSWORD']}
        credential.save!
        server = resource_fixture.hadoop_master_node
        server.local_ipv4 = "127.0.0.1"
        server.save!
      end

      it do
        tengine.should_not_fire
        tengine.receive("start.job.tengine", :properties => {
            :execution_id => @execution.id.to_s,
            :root_jobnet_id => @jobnet.id.to_s,
            :target_jobnet_id => @jobnet.id.to_s,
          })
        @jobnet.reload
        j11 = @jobnet.find_descendant_by_name_path("/rjn0001/j11")
        j11.executing_pid.should_not be_nil
        j11.exit_status.should == nil
        j11.phase_key.should == :running
        j11.previous_edges.length.should == 1
        j11.previous_edges.first.status_key.should == :transmitted
      end

    end
    end
  end

end
