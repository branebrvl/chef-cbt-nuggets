include_recipe 'selinux'
include_recipe 'apache2'
include_recipe 'apache2::mod_rewrite'
include_recipe 'apache2::mod_php5'
include_recipe 'apache2::mod_ssl'
include_recipe 'apache2::mod_log_config'
# Generate selfsigned ssl
execute "make-ssl-cert" do
  command "openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/httpd/ssl/apache.key -out /etc/httpd/ssl/apache.crt"
  ignore_failure true
  action :nothing
end

# Configure sites
sites = node["sites"] ||= []

sites.each do |name|
  site = data_bag_item("sites", name)

  puts "Installing site #{site["id"]}"

  # Add site to apache config
  web_app site["host"] do
    template "sites.conf.erb"
    server_name site["host"]
    server_aliases site["aliases"]
    docroot site["docroot"]
  end

  # Add site info in /etc/hosts
  bash "hosts" do
    aliases = site["aliases"].join(' ') if site["aliases"].kind_of?(Array)
    code "echo 127.0.0.1 #{site["host"]} #{aliases} >> /etc/hosts"
  end
end

# Disable default site
apache_site "default" do
  enable false
end
