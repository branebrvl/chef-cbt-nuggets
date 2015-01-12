# Cookbook Name:: web_server
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
# web_server cookbook recipes/default.rb

# include_recipe "apache::install"
# include_recipe "apache::base-files"

# node['php']['packages'].each do |pkg|
#     package pkg do
#       action :install
#     end
# end


include_recipe 'apache2'
include_recipe 'apache2::mod_php5'

include_recipe 'yum-epel'
include_recipe 'yum-remi'

node['php']['packages'].each do |package|
  yum_package package do
    action :install
  end
end
