#reference a value from ohai
if node["platform"] == "ubuntu"
  execute "apt-get update" do
    command "apt-get update"
  end
end

# Actaully install apache program

package_name = "httpd"

if node["platform"] == "ubuntu"
  package_name = "apache2"
end

package package_name do
  action :install
end

# start apache service and add it to bootup
service "httpd" do
  action [:start, :enable]
end
