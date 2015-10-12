require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'stove/rake_task'
require 'fileutils'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = FileList['files/spec/**/*_spec.rb']
end
Stove::RakeTask.new

task default: :spec
