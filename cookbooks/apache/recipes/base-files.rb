# Add a file for apache to serve
# cookbook_file "/var/www/html/index.html" do
#   source "index.html"
#   mode "0644"
# end

template "/var/www/html/index.html" do
  source "index.html.erb"
  mode "0644"
end
