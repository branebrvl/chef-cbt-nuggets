# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos-6.6"
  config.vm.hostname = "chef-node2"
  config.vm.network "private_network", ip: "192.168.33.30"
  config.ssh.forward_agent = true
  config.vm.synced_folder "", "/vagrant"
  config.vbguest.auto_update = false
  config.vbguest.no_remote = true
  # config.omnibus.chef_version = :latest
end
