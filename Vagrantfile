# -*- mode: ruby -*-
# vi: set ft=ruby :
secnario = 1

case secnario
  when 1
    machines = {
      :bindmaster => {
        :hostname => "bindmaster.lab1.vagrant",
        :ipaddress => "33.33.33.11",
        :run_list => "role[ns-master]",
      },
      :bindslave => {
        :hostname => "bindslave.lab1.vagrant",
        :ipaddress => "33.33.33.12",
        :run_list => "role[ns-slave]",
      }
    }
    when 2
      machines = {
        :bindcache => {
        :hostname => "bindcache.lab1.vagrant",
        :ipaddress => "33.33.33.13",
        :run_list => "role[ns-cache]",
      }
    }
  end
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.omnibus.chef_version = :latest
  config.vm.provider :virtualbox do |provider, override|
    provider.customize ['modifyvm', :id, '--memory', '1024']
#    config.vm.box = "chef/debian-7.4"
    config.vm.box = "chef/centos-6.5"
  end
  machines.each do |node, opt|
    config.vm.define node do |node_config|
      vm_name = opt[:hostname]
      ipaddress = opt[:ipaddress]
      node_config.vm.host_name = vm_name
      node_config.vm.network :private_network, :ip => ipaddress
#      node_config.vm.provision :shell, :inline => 'sed -i -e "/^deb cdrom/d" /etc/apt/sources.list'
      node_config.vm.provision :chef_client do |chef|
        chef.node_name = vm_name
        chef.log_level = :info
        chef.chef_server_url = "http://33.33.33.1:8889/"
        chef.validation_key_path = "~ram/.chef/validation.pem"
        run_list = []
        run_list << ENV['CHEF_RUN_LIST'].split(",") if ENV.has_key?('CHEF_RUN_LIST')
        chef.run_list = [opt[:run_list].split(","), run_list].flatten
      end
    end
  end
end
