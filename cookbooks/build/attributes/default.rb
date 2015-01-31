default['node']['version'] = 'v0.10.19'
default['npm']['packages'] = %w{ bower gulp yo grunt }

default['nvm']['repository'] = 'git://github.com/creationix/nvm.git'
default['nvm']['reference'] = 'master'

default[:nvm][:user]           = "nvm"
default[:nvm][:group]          = "nvm"
default[:nvm][:manage_home]    = true
default[:nvm][:group_users]    = %{ vagrant  }
default[:nvm][:user_home]      = "/home/#{node[:nvm][:user]}"
