require 'tmpdir'

describe "chef_bork cookbook" do
  let(:chef_repo_path) { Dir.mktmpdir }
  let(:cookbooks_path) { path = File.join(chef_repo_path, 'cookbooks'); Dir.mkdir(path); path }
  before do
    File.symlink(File.expand_path('../data/config.rb', __FILE__),
                 File.join(chef_repo_path, 'config.rb'))
    # Need berkshelf, we do. A hack, this is.
    File.symlink(File.expand_path('../../../..', __FILE__),
                 File.join(cookbooks_path, 'compat_resource'))
    File.symlink(File.expand_path('../../..', __FILE__),
                 File.join(cookbooks_path, 'chef_bork'))
    File.symlink(File.expand_path('../data/cookbooks/test', __FILE__),
                 File.join(cookbooks_path, 'test'))
    File.symlink(File.expand_path('../data/cookbooks/future', __FILE__),
                 File.join(cookbooks_path, 'future'))
    File.symlink(File.expand_path('../data/cookbooks/normal', __FILE__),
                 File.join(cookbooks_path, 'normal'))
  end

  require 'chef/mixin/shell_out'
  include Chef::Mixin::ShellOut

  it "when chef-client runs the test recipe, it succeeds" do
    result = shell_out!("bundle exec chef-client -c #{File.join(chef_repo_path, 'config.rb')} -F doc -o test::test,test")
    puts result.stdout
    puts result.stderr
#     expect(result.stdout).to match(/
# Recipe: test::test
#   \* future_resource\[sets neither x nor y\] action create \(up to date\)
#   \* future_resource\[sets both x and y\] action create
#     - update sets both x and y
#     -   set x to "hi" \(was "initial_x"\)
#     -   set y to 10 \(was 2\)
#   \* future_resource\[sets neither x nor y explicitly\] action create \(up to date\)
#   \* future_resource\[sets only y\] action create
#     - update sets only y
#     -   set y to 20 (was 10)
#   \* future_resource\[deletes resource\] action delete \(up to date\)
#   \* future_resource\[sets x and y via creation\] action create
#     - create sets x and y via creation
#     -   set x to "hi"
#     -   set y to 20
#   \* future_resource\[deletes resource again\] action delete \(up to date\)
#   \* future_resource\[sets x and y to their defaults via creation\] action create
#     - create sets x and y to their defaults via creation
#     -   set x to "16" \(default value\)
#     -   set y to 4 \(default value\)
# /)
  end
end
