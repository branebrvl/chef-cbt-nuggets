# Cookbook Name:: web_server
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
# web_server cookbook recipes/default.rb

include_recipe "apache::install"
include_recipe "apache::base-files"

