include_recipe 'git'

# Create nvm dir and its contents
group node[:nvm][:group] do
  members node[:nvm][:group_users] if node[:nvm][:group_users]
end

user node[:nvm][:user] do
  shell "/bin/bash"
  group node[:nvm][:group]
  supports :manage_home => node[:nvm][:manage_home]
  home node[:nvm][:user_home]
end

directory "/usr/local/nvm" do
  owner node[:nvm][:user]
  group node[:nvm][:group]
  mode "2775"
end

git "/usr/local/nvm" do
  repository node['nvm']['repository']
  reference node['nvm']['reference']
  action :sync
  
  notifies :create, "template[/etc/profile.d/nvm.sh]", :immediately
end

template "/etc/profile.d/nvm.sh" do
  source 'nvm.sh.erb'
  mode 0644
end

directory '/usr/local/nvm/alias' do
  action :create
end
# execute "echo '#{nvm_source}' >> $HOME/.bash_profile" do
#   not_if "grep nvm $HOME/.bash_profile"
# end
