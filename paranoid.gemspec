# -*- encoding: utf-8 -*-
$:.push(File.expand_path('../lib', __FILE__))
require('paranoid/version')

Gem::Specification.new do |s|
  s.name        = 'paranoid'
  s.version     = Paranoid::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["David Genord II <github@xspond.com>", "Philipp Ullmann <philipp.ullmann@create.at>", "Paul Gallagher <gallagher.paul@gmail.com>"]
  s.email       = 'philipp.ullmann@create.at'
  s.homepage    = 'http://github.com/create-philipp-ullmann/paranoid/'
  s.summary     = 'Enable soft delete of ActiveRecord records. Based off defunct ActsAsParanoid and IsParanoid'

  s.rubyforge_project = 'paranoid'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
  
  s.add_development_dependency('rake', ['~> 0.9.2.2'])
  s.add_development_dependency('rspec', ['~> 2.8.0'])
  s.add_development_dependency('sqlite3', ['~> 1.3.5'])
  s.add_runtime_dependency('activerecord', ['~> 3.2.0'])
end
