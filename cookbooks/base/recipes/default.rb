#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
#

include_recipe 'git'
include_recipe 'base::unzip'
include_recipe 'zsh'
include_recipe 'base::dotfiles'
