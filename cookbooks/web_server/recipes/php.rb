include_recipe 'yum-epel'
include_recipe 'yum-remi'

node['php']['packages'].each do |package|
  yum_package package do
    action :install
  end
end
