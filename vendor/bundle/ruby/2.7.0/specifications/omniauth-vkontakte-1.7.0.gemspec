# -*- encoding: utf-8 -*-
# stub: omniauth-vkontakte 1.7.0 ruby lib

Gem::Specification.new do |s|
  s.name = "omniauth-vkontakte".freeze
  s.version = "1.7.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Anton Maminov".freeze]
  s.date = "2021-01-12"
  s.email = ["anton.maminov@gmail.com".freeze]
  s.homepage = "https://github.com/mamantoha/omniauth-vkontakte".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5.0".freeze)
  s.rubygems_version = "3.1.4".freeze
  s.summary = "Vkontakte OAuth2 Strategy for OmniAuth".freeze

  s.installed_by_version = "3.1.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<omniauth-oauth2>.freeze, [">= 1.5", "<= 1.7.1"])
  else
    s.add_dependency(%q<omniauth-oauth2>.freeze, [">= 1.5", "<= 1.7.1"])
  end
end
