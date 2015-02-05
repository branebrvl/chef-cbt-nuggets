include_recipe 'git'
include_recipe 'zsh'

# install vim and tmux
%w(vim-enhanced tmux).each do |pkg|
  package pkg
end

home_dir = "/home/#{node['dotfiles']['user']}"
# install dotfiles
bash "install_branes_dotfiles" do
  cwd home_dir
  user node['dotfiles']['user']
    # cd #{home_dir}
  code <<-EOH
    git clone https://github.com/branebrvl/dotfiles.git
    ./dotfiles/setup.sh 
  EOH
  environment 'HOME' => home_dir
end

# tools
#
# home_dir = "/home/#{node['dotfiles']['user']}"
#
# # setup ssh keys
# file "#{home_dir}/.ssh/id_rsa" do
#   owner node['dotfiles']['user']
#   group node['dotfiles']['group']
#   mode "0600"
#   content node['dotfiles']['private_key']
#   action :create
# end
#
# file "#{home_dir}/.ssh/id_rsa.pub" do
#   owner node['dotfiles']['user']
#   group node['dotfiles']['group']
#   mode "0600"
#   content node['dotfiles']['public_key']
#   action :create
# end

# sync dotfiles
# git "#{home_dir}/dotfiles" do
#   repository "git://github.com/nickcharlton/dotfiles.git"
#   reference "master"
#   enable_submodules true
#   user node['dotfiles']['user']
#   group node['dotfiles']['group']
#   action :checkout
# end
#
# # setup dotfiles
# bash "setup_dotfiles" do
#   cwd "#{home_dir}/dotfiles"
#   user node['dotfiles']['user']
#   group node['dotfiles']['group']
#   environment "HOME" => home_dir
#   code "./setup.sh"
# end
