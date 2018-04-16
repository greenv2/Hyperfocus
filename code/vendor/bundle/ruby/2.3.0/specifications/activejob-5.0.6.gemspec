# -*- encoding: utf-8 -*-
# stub: activejob 5.0.6 ruby lib

Gem::Specification.new do |s|
  s.name = "activejob"
  s.version = "5.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["David Heinemeier Hansson"]
  s.date = "2017-09-08"
  s.description = "Declare job classes that can be run by a variety of queueing backends."
  s.email = "david@loudthinking.com"
  s.homepage = "http://rubyonrails.org"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.2")
  s.rubygems_version = "2.5.1"
  s.summary = "Job framework with pluggable queues."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, ["= 5.0.6"])
      s.add_runtime_dependency(%q<globalid>, [">= 0.3.6"])
    else
      s.add_dependency(%q<activesupport>, ["= 5.0.6"])
      s.add_dependency(%q<globalid>, [">= 0.3.6"])
    end
  else
    s.add_dependency(%q<activesupport>, ["= 5.0.6"])
    s.add_dependency(%q<globalid>, [">= 0.3.6"])
  end
end
