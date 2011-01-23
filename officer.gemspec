# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{officer}
  s.version = "0.8.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Chad Remesch"]
  s.date = %q{2011-01-22}
  s.default_executable = %q{officer}
  s.description = %q{Officer is designed to help you coordinate distributed processes and avoid race conditions.}
  s.email = %q{chad@remesch.com}
  s.executables = ["officer"]
  s.extra_rdoc_files = [
    "LICENSE",
    "README.markdown"
  ]
  s.files = [
    ".autotest",
    ".document",
    ".rspec",
    "LICENSE",
    "README.markdown",
    "Rakefile",
    "VERSION",
    "bin/officer",
    "lib/officer.rb",
    "lib/officer/client.rb",
    "lib/officer/commands.rb",
    "lib/officer/connection.rb",
    "lib/officer/lock_store.rb",
    "lib/officer/log.rb",
    "lib/officer/server.rb",
    "officer.gemspec",
    "spec/integration/officer_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/chadrem/officer}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Ruby lock server and client built on EventMachine.}
  s.test_files = [
    "spec/integration/officer_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["= 2.4.0"])
      s.add_runtime_dependency(%q<eventmachine>, [">= 0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_runtime_dependency(%q<daemons>, [">= 0"])
      s.add_runtime_dependency(%q<choice>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, ["= 2.4.0"])
      s.add_dependency(%q<eventmachine>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<daemons>, [">= 0"])
      s.add_dependency(%q<choice>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, ["= 2.4.0"])
    s.add_dependency(%q<eventmachine>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<daemons>, [">= 0"])
    s.add_dependency(%q<choice>, [">= 0"])
  end
end

