For CentOS
rpm -Uvh /tmp/chef-server-core-<version>.rpm
For Ubuntu:
dpkg -i /tmp/chef-server-core-<version>.deb

after installing chef server - configure it
sudo chef-server-ctl reconfigure

install web interface
sudo chef-server-ctl install opscode-manage
configure it
sudo opscode-manage-ctl reconfigure

chef-server-ctl user-create user_name first_name last_name email password --filename FILE_NAME
chef-server-ctl org-create ORG-NAME -a USER-NAME -f FILE_NAME-TO-WRITE-PRIVATE_KEY
for the file name location use /etc/chef/

Bootsraping a node
knife bootstrap chef-node1 -x user --sudo -P password
knife bootstrap chef-node2 -x vagrant --sudo -P vagrant -r "role[webserver]"

List clients
knife client list

Create a cookbookj
knife cookbook create apache

upload a cookbook
knife cookbook upload apache

Update run list for a node
knife node run_list add NODE_NAME RUN_LIST_ITEM (options)
knife node run_list add chef-node1 apache::install 
knife node run_list add chef-node1 'role[centos-webserver]'

knife node run_list remove chef-node1 'recipe[apache::hm]'
knife node show chef-node1 -r 

Information about a node
knife node show chef-node1
List all information OHAI can provide
knife node show chef-node1 -l
Show a specific attribute
knife node show chef-node1 -a bandwith

Show metadata
knife cookbook show apache 


Cookbook roles
knife role from file centos-webserver.rb
knife role delete ubuntu-webserver
knife role list

Community Tools
https://supermarket.chef.io/
 knife cookbook site install NAME_OF_THE_COOKBOOK

Berkshelf(.com)
 - replaces "knife cookbook _______"

 Chef Solo

knife solo cook user@server  -i private_key --no-berkshelf --no-librarian
