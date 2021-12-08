# -*- encoding: utf-8 -*-
# stub: bootstrap-kaminari-views 0.0.5 ruby lib

Gem::Specification.new do |s|
  s.name = "bootstrap-kaminari-views".freeze
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Matenia Rossides".freeze]
  s.date = "2014-09-06"
  s.description = "Bootstrap-ify pagination with Kaminari - Compatible with Bootstrap 2.x, 3.x".freeze
  s.email = ["matenia@gmail.com".freeze]
  s.homepage = "http://github.com/matenia/bootstrap-kaminari-views".freeze
  s.rubygems_version = "3.2.3".freeze
  s.summary = "Bootstrap-ify pagination with Kaminari".freeze

  s.installed_by_version = "3.2.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rails>.freeze, [">= 3.1"])
    s.add_runtime_dependency(%q<kaminari>.freeze, [">= 0.13"])
    s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rails>.freeze, [">= 3.1"])
    s.add_dependency(%q<kaminari>.freeze, [">= 0.13"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
  end
end
