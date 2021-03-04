# -*- encoding: utf-8 -*-
# stub: capistrano-resque 0.2.3 ruby lib

Gem::Specification.new do |s|
  s.name = "capistrano-resque".freeze
  s.version = "0.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Steven Shingler".freeze]
  s.date = "2016-10-17"
  s.description = "Capistrano plugin that integrates Resque server tasks.".freeze
  s.email = "shingler@gmail.com".freeze
  s.homepage = "https://github.com/sshingler/capistrano-resque".freeze
  s.rubygems_version = "3.1.4".freeze
  s.summary = "Resque integration for Capistrano".freeze

  s.installed_by_version = "3.1.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<capistrano>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<resque>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<resque-scheduler>.freeze, [">= 0"])
  else
    s.add_dependency(%q<capistrano>.freeze, [">= 0"])
    s.add_dependency(%q<resque>.freeze, [">= 0"])
    s.add_dependency(%q<resque-scheduler>.freeze, [">= 0"])
  end
end
