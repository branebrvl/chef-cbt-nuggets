# See http://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "branebrvl"
client_key               "#{current_dir}/branebrvl.pem"
validation_client_name   "abcwidgets-validator"
validation_key           "#{current_dir}/abcwidgets-validator.pem"
chef_server_url          "https://chef-server:443/organizations/abcwidgets"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
