begin
  chef_bork_gem = Gem::Specification.find_by_name("chef_bork")
rescue Gem::LoadError
end

if chef_bork_gem
  # The gem is installed.
  require 'chef_bork'
  # Make sure the version installed is more recent than the cookbook so there's no confusion.
  version_rb = IO.read(File.expand_path("../../files/lib/chef_bork/version.rb", __FILE__))
  raise "Version file not in correct format" unless version_rb =~ /VERSION\s*=\s*'([^']+)'/
  version = $1
  if Gem::Version.new(version) > Gem::Version.new(ChefBork::VERSION)
    raise "Installed chef_bork gem #{ChefBork::VERSION} is *older* than the chef_bork cookbook. Please install a more recent version."
  end
  Chef::Log.info("Using chef_bork gem version #{ChefBork::VERSION} installed on system instead of chef_bork cookbook (which is version #{version}).")
else

  # The cookbook is the only copy; load the cookbook.
  $:.unshift File.expand_path("../../files/lib", __FILE__)
  require 'chef_bork'
end
