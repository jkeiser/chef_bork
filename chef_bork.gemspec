$:.unshift File.expand_path('../files/lib', __FILE__)
project = File.basename(__FILE__)[0..-'.gemspec'.length-1]
require "chef_bork/version"

Gem::Specification.new do |s|
  s.name = project
  s.version = ChefBork::VERSION
  s.platform = Gem::Platform::RUBY
  s.summary = 'Bring crazy new Chef features to the world'
  s.description = s.summary
  s.author = 'John Keiser'
  s.email = 'john@johnkeiser.com'
  s.homepage = 'http://chef.io'
  s.license = 'Apache 2.0'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'cheffish'
  s.add_development_dependency 'stove'
  s.add_development_dependency 'chef'

  s.bindir       = 'bin'
  s.executables  = []
  s.require_path = 'files/lib'
  s.files = %w(LICENSE README.md CHANGELOG.md Gemfile Rakefile) + Dir.glob('{files/lib,spec}/**/*', File::FNM_DOTMATCH).reject {|f| File.directory?(f)}
end
