# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{foreman}
  s.version = "0.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Dollar"]
  s.date = %q{2010-06-30}
  s.default_executable = %q{foreman}
  s.description = %q{Process manager for applications with multiple components}
  s.email = %q{ddollar@gmail.com}
  s.executables = ["foreman"]
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    "Rakefile",
     "bin/foreman",
     "export/upstart/master.conf.erb",
     "export/upstart/process.conf.erb",
     "export/upstart/process_master.conf.erb",
     "lib/foreman.rb",
     "lib/foreman/cli.rb",
     "lib/foreman/engine.rb",
     "lib/foreman/export.rb",
     "lib/foreman/export/base.rb",
     "lib/foreman/export/inittab.rb",
     "lib/foreman/export/upstart.rb",
     "lib/foreman/process.rb",
     "spec/foreman/cli_spec.rb",
     "spec/foreman/engine_spec.rb",
     "spec/foreman/export/upstart_spec.rb",
     "spec/foreman/export_spec.rb",
     "spec/foreman/process_spec.rb",
     "spec/foreman_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.has_rdoc = false
  s.homepage = %q{http://github.com/ddollar/foreman}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Process manager for applications with multiple components}
  s.test_files = [
    "spec/foreman/cli_spec.rb",
     "spec/foreman/engine_spec.rb",
     "spec/foreman/export/upstart_spec.rb",
     "spec/foreman/export_spec.rb",
     "spec/foreman/process_spec.rb",
     "spec/foreman_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<fakefs>, ["~> 0.2.1"])
      s.add_development_dependency(%q<rake>, ["~> 0.8.7"])
      s.add_development_dependency(%q<rcov>, ["~> 0.9.8"])
      s.add_development_dependency(%q<rr>, ["~> 0.10.11"])
      s.add_development_dependency(%q<rspec>, ["~> 2.0.0"])
      s.add_runtime_dependency(%q<term-ansicolor>, ["~> 1.0.5"])
      s.add_runtime_dependency(%q<thor>, ["~> 0.13.6"])
    else
      s.add_dependency(%q<fakefs>, ["~> 0.2.1"])
      s.add_dependency(%q<rake>, ["~> 0.8.7"])
      s.add_dependency(%q<rcov>, ["~> 0.9.8"])
      s.add_dependency(%q<rr>, ["~> 0.10.11"])
      s.add_dependency(%q<rspec>, ["~> 2.0.0"])
      s.add_dependency(%q<term-ansicolor>, ["~> 1.0.5"])
      s.add_dependency(%q<thor>, ["~> 0.13.6"])
    end
  else
    s.add_dependency(%q<fakefs>, ["~> 0.2.1"])
    s.add_dependency(%q<rake>, ["~> 0.8.7"])
    s.add_dependency(%q<rcov>, ["~> 0.9.8"])
    s.add_dependency(%q<rr>, ["~> 0.10.11"])
    s.add_dependency(%q<rspec>, ["~> 2.0.0"])
    s.add_dependency(%q<term-ansicolor>, ["~> 1.0.5"])
    s.add_dependency(%q<thor>, ["~> 0.13.6"])
  end
end

