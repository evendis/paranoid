require 'rake/rdoctask'
require 'rspec'
require 'rspec/core/rake_task'


RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = ["-c", "-f progress"]
  t.pattern = 'spec/**/*_spec.rb'
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = %q{paranoid}
    s.summary = %q{Soft deletion for Rails 3 ActiveRecord}
    s.email = %q{gallagher.paul@gmail.com}
    s.homepage = %q{http://github.com/tardate/paranoid/}
    s.description = "Based on the defunct ActsAsParanoid and IsParanoid"
    s.authors = ["David Genord II <github@xspond.com>",
      "Philipp Ullmann <philipp.ullmann@create.at>",
      "Paul Gallagher <gallagher.paul@gmail.com>"]
    s.add_dependency('activerecord', '~> 3.0.3')
    s.add_development_dependency('rspec', '~> 2.3.0')
    s.add_development_dependency('sqlite3', '~> 0.1.1')
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end

Rake::RDocTask.new { |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.title    = "Paranoid"
  rdoc.options << '--line-numbers' << '--inline-source' << '-A cattr_accessor=object'
  rdoc.options << '--charset' << 'utf-8'
  rdoc.template = ENV['template'] ? "#{ENV['template']}.rb" : './rdoc/template.rb'
  rdoc.rdoc_files.include('README.textile')
  rdoc.rdoc_files.include('lib/**/*.rb')
}

task :default  => :spec