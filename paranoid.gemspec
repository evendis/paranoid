# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{paranoid}
  s.version = "0.0.11"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Genord II <github@xspond.com>", "Philipp Ullmann <philipp.ullmann@create.at>", "Paul Gallagher <gallagher.paul@gmail.com>"]
  s.date = %q{2011-02-10}
  s.description = %q{Based on the defunct ActsAsParanoid and IsParanoid}
  s.email = %q{gallagher.paul@gmail.com}
  s.extra_rdoc_files = [
    "README.textile"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "MIT-LICENSE",
    "README.textile",
    "Rakefile",
    "VERSION.yml",
    "init.rb",
    "lib/paranoid.rb",
    "lib/paranoid/base.rb",
    "lib/paranoid/join_association.rb",
    "lib/paranoid/paranoid_methods.rb",
    "lib/paranoid/relation.rb",
    "paranoid.gemspec",
    "rdoc/template.rb",
    "spec/database.yml",
    "spec/models.rb",
    "spec/paranoid_spec.rb",
    "spec/schema.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/tardate/paranoid/}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Soft deletion for Rails 3 ActiveRecord}
  s.test_files = [
    "spec/models.rb",
    "spec/paranoid_spec.rb",
    "spec/schema.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.0.3"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.1"])
      s.add_runtime_dependency(%q<activerecord>, ["~> 3.0.3"])
      s.add_development_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_development_dependency(%q<sqlite3>, ["~> 0.1.1"])
    else
      s.add_dependency(%q<rails>, [">= 3.0.3"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.1"])
      s.add_dependency(%q<activerecord>, ["~> 3.0.3"])
      s.add_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_dependency(%q<sqlite3>, ["~> 0.1.1"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0.3"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.1"])
    s.add_dependency(%q<activerecord>, ["~> 3.0.3"])
    s.add_dependency(%q<rspec>, ["~> 2.3.0"])
    s.add_dependency(%q<sqlite3>, ["~> 0.1.1"])
  end
end

