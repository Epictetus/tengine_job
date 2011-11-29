# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "tengine_job"
  s.version = "0.4.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["saishu", "w-irie", "taigou", "totty", "hiroshinakao", "g-morita", "guemon", "aoetk", "hattori-at-nt", "t-yamada", "y-karashima", "akm"]
  s.date = "2011-11-29"
  s.description = "tengine_job provides jobnet management"
  s.email = "tengine@nautilus-technologies.com"
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "examples/0004_retry_one_layer.rb",
    "examples/0004_retry_one_layer.sh",
    "examples/0005_retry_two_layer.rb",
    "examples/0005_retry_two_layer.sh",
    "examples/0006_retry_three_layer.rb",
    "examples/0006_retry_three_layer.sh",
    "examples/0007_simple_jobnet.rb",
    "examples/VERSION",
    "examples/tengine_job_test.sh",
    "lib/tengine/job.rb",
    "lib/tengine/job/category.rb",
    "lib/tengine/job/connectable.rb",
    "lib/tengine/job/drivers/job_control_driver.rb",
    "lib/tengine/job/drivers/job_execution_driver.rb",
    "lib/tengine/job/drivers/jobnet_control_driver.rb",
    "lib/tengine/job/drivers/schedule_driver.rb",
    "lib/tengine/job/dsl_binder.rb",
    "lib/tengine/job/dsl_evaluator.rb",
    "lib/tengine/job/dsl_loader.rb",
    "lib/tengine/job/edge.rb",
    "lib/tengine/job/element_selector_notation.rb",
    "lib/tengine/job/end.rb",
    "lib/tengine/job/executable.rb",
    "lib/tengine/job/execution.rb",
    "lib/tengine/job/expansion.rb",
    "lib/tengine/job/fork.rb",
    "lib/tengine/job/job.rb",
    "lib/tengine/job/jobnet.rb",
    "lib/tengine/job/jobnet/builder.rb",
    "lib/tengine/job/jobnet/job_state_transition.rb",
    "lib/tengine/job/jobnet/jobnet_state_transition.rb",
    "lib/tengine/job/jobnet/state_transition.rb",
    "lib/tengine/job/jobnet_actual.rb",
    "lib/tengine/job/jobnet_template.rb",
    "lib/tengine/job/join.rb",
    "lib/tengine/job/junction.rb",
    "lib/tengine/job/killing.rb",
    "lib/tengine/job/mm_compatibility.rb",
    "lib/tengine/job/mm_compatibility/connectable.rb",
    "lib/tengine/job/name_path.rb",
    "lib/tengine/job/root.rb",
    "lib/tengine/job/root_jobnet_actual.rb",
    "lib/tengine/job/root_jobnet_template.rb",
    "lib/tengine/job/script_executable.rb",
    "lib/tengine/job/signal.rb",
    "lib/tengine/job/start.rb",
    "lib/tengine/job/stoppable.rb",
    "lib/tengine/job/vertex.rb",
    "lib/tengine_job.rb",
    "spec/fixtures/rjn_0001_simple_jobnet_builder.rb",
    "spec/fixtures/rjn_0002_simple_parallel_jobnet_builder.rb",
    "spec/fixtures/rjn_0003_fork_join_jobnet_builder.rb",
    "spec/fixtures/rjn_0005_retry_two_layer_fixture.rb",
    "spec/fixtures/rjn_0008_expansion_fixture.rb",
    "spec/fixtures/rjn_0009_tree_sequential_jobnet_builder.rb",
    "spec/fixtures/rjn_0010_2jobs_and_1job_parallel_jobnet_builder.rb",
    "spec/fixtures/rjn_0011_nested_fork_jobnet_builder.rb",
    "spec/fixtures/rjn_0012_nested_and_finally_builder.rb",
    "spec/fixtures/rjn_means_root_jobnet",
    "spec/fixtures/test_credential_fixture.rb",
    "spec/fixtures/test_server_fixture.rb",
    "spec/mongoid.yml",
    "spec/spec_helper.rb",
    "spec/sshd/.gitignore",
    "spec/sshd/id_rsa",
    "spec/sshd/id_rsa.pub",
    "spec/sshd/ssh_host_rsa_key",
    "spec/sshd/ssh_host_rsa_key.pub",
    "spec/sshd/sshd_config.erb",
    "spec/sshd/tengine_job_test.sh",
    "spec/support/jobnet_fixture_builder.rb",
    "spec/tengine/job/category_spec.rb",
    "spec/tengine/job/connectable_spec.rb",
    "spec/tengine/job/drivers/job_controll_driver/expansion_spec.rb",
    "spec/tengine/job/drivers/job_controll_driver_spec.rb",
    "spec/tengine/job/drivers/job_execution_driver_spec.rb",
    "spec/tengine/job/drivers/jobnet_control_driver/nested_and_finally_spec.rb",
    "spec/tengine/job/drivers/jobnet_control_driver/nested_jobnet_spec.rb",
    "spec/tengine/job/drivers/jobnet_control_driver/stop_jobnet_spec.rb",
    "spec/tengine/job/drivers/jobnet_control_driver_spec.rb",
    "spec/tengine/job/drivers/schedule_driver_spec.rb",
    "spec/tengine/job/dsl_binder_spec.rb",
    "spec/tengine/job/dsl_loader_spec.rb",
    "spec/tengine/job/dsls/0013_hadoop_job_run.rb",
    "spec/tengine/job/dsls/0014_join_and_join.rb",
    "spec/tengine/job/dsls/0015_fork_and_fork.rb",
    "spec/tengine/job/dsls/0016_complex_fork_and_join.rb",
    "spec/tengine/job/dsls/0017_finally.rb",
    "spec/tengine/job/dsls/0018_expansion.rb",
    "spec/tengine/job/dsls/0019_execute_job_on_event.rb",
    "spec/tengine/job/dsls/VERSION",
    "spec/tengine/job/edge_spec.rb",
    "spec/tengine/job/element_selector_notation_spec.rb",
    "spec/tengine/job/examples_spec.rb",
    "spec/tengine/job/execution_spec.rb",
    "spec/tengine/job/expansion_spec.rb",
    "spec/tengine/job/job_spec.rb",
    "spec/tengine/job/jobnet/1015_complecated_jobnet_spec.rb",
    "spec/tengine/job/jobnet_actual_spec.rb",
    "spec/tengine/job/jobnet_spec.rb",
    "spec/tengine/job/jobnet_template_spec.rb",
    "spec/tengine/job/killing_spec.rb",
    "spec/tengine/job/root_jobnet_actual_spec.rb",
    "spec/tengine/job/root_jobnet_template_spec.rb",
    "spec/tengine/job/script_executable_spec.rb",
    "spec/tengine/job/stoppable_spec.rb",
    "spec/tengine/job/vertex_spec.rb",
    "spec/tengine_job_spec.rb",
    "tengine_job.gemspec",
    "tmp/log/.gitignore"
  ]
  s.homepage = "http://github.com/tengine/tengine_job"
  s.licenses = ["MPL/LGPL"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.11"
  s.summary = "tengine_job provides jobnet management"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<tengine_support>, ["~> 0.3.12"])
      s.add_runtime_dependency(%q<tengine_core>, ["~> 0.4.0"])
      s.add_runtime_dependency(%q<tengine_resource>, ["~> 0.4.0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.6.0"])
      s.add_development_dependency(%q<factory_girl>, ["~> 2.1.2"])
      s.add_development_dependency(%q<yard>, ["~> 0.7.2"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.18"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.5.3"])
      s.add_development_dependency(%q<ZenTest>, ["~> 4.6.2"])
    else
      s.add_dependency(%q<tengine_support>, ["~> 0.3.12"])
      s.add_dependency(%q<tengine_core>, ["~> 0.4.0"])
      s.add_dependency(%q<tengine_resource>, ["~> 0.4.0"])
      s.add_dependency(%q<rspec>, ["~> 2.6.0"])
      s.add_dependency(%q<factory_girl>, ["~> 2.1.2"])
      s.add_dependency(%q<yard>, ["~> 0.7.2"])
      s.add_dependency(%q<bundler>, ["~> 1.0.18"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_dependency(%q<simplecov>, ["~> 0.5.3"])
      s.add_dependency(%q<ZenTest>, ["~> 4.6.2"])
    end
  else
    s.add_dependency(%q<tengine_support>, ["~> 0.3.12"])
    s.add_dependency(%q<tengine_core>, ["~> 0.4.0"])
    s.add_dependency(%q<tengine_resource>, ["~> 0.4.0"])
    s.add_dependency(%q<rspec>, ["~> 2.6.0"])
    s.add_dependency(%q<factory_girl>, ["~> 2.1.2"])
    s.add_dependency(%q<yard>, ["~> 0.7.2"])
    s.add_dependency(%q<bundler>, ["~> 1.0.18"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
    s.add_dependency(%q<simplecov>, ["~> 0.5.3"])
    s.add_dependency(%q<ZenTest>, ["~> 4.6.2"])
  end
end

