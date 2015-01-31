# install nvm
include_recipe 'build::nvm'

# Install Node
bash "install_node" do
  code <<-EOH
      source /usr/local/nvm/nvm.sh      
      nvm install #{node['node']['version']}
      nvm alias default #{node['node']['version']}
      nvm use #{node['node']['version']}
    EOH
end

execute "change-mode" do
  command "chmod -R 0775 /usr/local/nvm/#{node['node']['version']}"
end

execute "change-permission" do
  command "chown -R root:#{node[:nvm][:group]} /usr/local/nvm/#{node['node']['version']}"
end

#install global npm packages
packages = node['npm']['packages'] ||= []

packages.each do |package|
  bash "install_npm_package#{package}" do
    code <<-EOH
      su -l vagrant -c "npm install -g #{package}"
    EOH
  end
end
#
# execute "echo 'export PATH=$HOME/npm/bin:$PATH' >> ~/.bash_profile" do
#   not_if "grep npm ~/.bash_profile"
# eef d
