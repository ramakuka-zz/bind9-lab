#
# Cookbook Name:: bind-master
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'bind9-ng::install_bind'

host = Hash.new
host['a'] = '1.2.3.4'
host['b'] = '1.2.3.5'
host['c'] = '1.2.3.11'
host['d'] = "c.#{node[:zone]}"

bind9_ng_zone node[:zone] do
  email "hostmaster.dt-hbs.com"
  nameserver node[:nameserver]
  hosts host
  mailserver node[:mailserver]
end


slave_nodes = partial_search(:node, "role:#{node['bind9']['slaverole']}",
   :keys => { 'hostname' => [ 'hostname' ],
              'network' => ['network'],
              'bindview' => ['bindview']
   })


slavehost = Hash.new
slave_nodes.each do |matching_node|
  slavehost[matching_node['bindview']] = Array.new
  addr = get_ipaddress(:interface => node[:bind9][:mgn_int],:node => matching_node)
  if addr
    slavehost[matching_node['bindview']] << addr
  end
end
node.normal[:bind9][:notify] = slavehost


include_recipe 'bind9-ng::config'
