# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "tengine_job"
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["akima"]
  s.date = "2011-10-26"
  s.description = "tengine_job provides jobnet management"
  s.email = "akima@nautilus-technologies.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "examples/0004_retry_one_layer.rb",
    "examples/0005_retry_two_layer.rb",
    "examples/0006_retry_three_layer.rb",
    "examples/VERSION",
    "lib/tengine/job.rb",
    "lib/tengine/job/category.rb",
    "lib/tengine/job/connectable.rb",
    "lib/tengine/job/drivers/job_control_driver.rb",
    "lib/tengine/job/drivers/job_execution_driver.rb",
    "lib/tengine/job/drivers/jobnet_control_driver.rb",
    "lib/tengine/job/dsl_binder.rb",
    "lib/tengine/job/dsl_evaluator.rb",
    "lib/tengine/job/dsl_loader.rb",
    "lib/tengine/job/edge.rb",
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
    "spec/fixtures/rjn_0004_tree_sequential_jobnet_builder.rb",
    "spec/fixtures/rjn_0005_2jobs_and_1job_parallel_jobnet_builder.rb",
    "spec/fixtures/rjn_0006_nested_fork_jobnet_builder.rb",
    "spec/fixtures/rjn_0007_nested_and_finally_builder.rb",
    "spec/fixtures/rjn_means_root_jobnet",
    "spec/mongoid.yml",
    "spec/spec_helper.rb",
    "spec/support/jobnet_fixture_builder.rb",
    "spec/tengine/job/category_spec.rb",
    "spec/tengine/job/connectable_spec.rb",
    "spec/tengine/job/drivers/job_controll_driver_spec.rb",
    "spec/tengine/job/drivers/job_execution_driver_spec.rb",
    "spec/tengine/job/drivers/jobnet_control_driver/nested_and_finally_spec.rb",
    "spec/tengine/job/drivers/jobnet_control_driver/nested_jobnet_spec.rb",
    "spec/tengine/job/drivers/jobnet_control_driver_spec.rb",
    "spec/tengine/job/dsl_loader_spec.rb",
    "spec/tengine/job/dsls/0001_hadoop_job_run.rb",
    "spec/tengine/job/dsls/0002_join_and_join.rb",
    "spec/tengine/job/dsls/0003_fork_and_fork.rb",
    "spec/tengine/job/dsls/0004_complex_fork_and_join.rb",
    "spec/tengine/job/dsls/0005_finally.rb",
    "spec/tengine/job/dsls/0006_expansion.rb",
    "spec/tengine/job/dsls/VERSION",
    "spec/tengine/job/edge_spec.rb",
    "spec/tengine/job/examples_spec.rb",
    "spec/tengine/job/execution_spec.rb",
    "spec/tengine/job/expansion_spec.rb",
    "spec/tengine/job/job_spec.rb",
    "spec/tengine/job/jobnet_actual_spec.rb",
    "spec/tengine/job/jobnet_spec.rb",
    "spec/tengine/job/jobnet_template_spec.rb",
    "spec/tengine/job/root_jobnet_actual_spec.rb",
    "spec/tengine/job/root_jobnet_template_spec.rb",
    "spec/tengine/job/script_executable_spec.rb",
    "spec/tengine/job/vertex_spec.rb",
    "spec/tengine_job_spec.rb",
    "tengine_job.gemspec",
    "tmp/log/.gitignore"
  ]
  s.homepage = "http://github.com/akm/tengine_job"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.11"
  s.summary = "tengine_job provides jobnet management"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<tengine_core>, ["~> 0.1.14"])
      s.add_runtime_dependency(%q<tengine_resource>, ["~> 0.0.4"])
      s.add_development_dependency(%q<rspec>, ["~> 2.6.0"])
      s.add_development_dependency(%q<factory_girl>, ["~> 2.1.2"])
      s.add_development_dependency(%q<yard>, ["~> 0.7.2"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.18"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.5.3"])
      s.add_development_dependency(%q<ZenTest>, ["~> 4.6.2"])
    else
      s.add_dependency(%q<tengine_core>, ["~> 0.1.14"])
      s.add_dependency(%q<tengine_resource>, ["~> 0.0.4"])
      s.add_dependency(%q<rspec>, ["~> 2.6.0"])
      s.add_dependency(%q<factory_girl>, ["~> 2.1.2"])
      s.add_dependency(%q<yard>, ["~> 0.7.2"])
      s.add_dependency(%q<bundler>, ["~> 1.0.18"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_dependency(%q<simplecov>, ["~> 0.5.3"])
      s.add_dependency(%q<ZenTest>, ["~> 4.6.2"])
    end
  else
    s.add_dependency(%q<tengine_core>, ["~> 0.1.14"])
    s.add_dependency(%q<tengine_resource>, ["~> 0.0.4"])
    s.add_dependency(%q<rspec>, ["~> 2.6.0"])
    s.add_dependency(%q<factory_girl>, ["~> 2.1.2"])
    s.add_dependency(%q<yard>, ["~> 0.7.2"])
    s.add_dependency(%q<bundler>, ["~> 1.0.18"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
    s.add_dependency(%q<simplecov>, ["~> 0.5.3"])
    s.add_dependency(%q<ZenTest>, ["~> 4.6.2"])
  end
end

