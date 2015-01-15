#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
# First run apt-get update 

# execute "apt-get update" do
#   command "apt-get update"
# end
# Yum refreshes each time it's used

# Actaully install apache program

# package "apache2" do
# package "httpd" do
#   action :install
# end

# start apache service and add it to bootup
# service "httpd" do
#   action [:start, :enable]
# end

# Add a file for apache to serve
# cookbook_file "/var/www/html/index.html" do
#   source "index.html"
#   mode "0644"
# end
