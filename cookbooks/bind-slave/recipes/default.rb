#
# Cookbook Name:: bind-slave
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'bind9-ng::install_bind'
view = node[:bindview]
master_nodes = partial_search(:node, "role:#{node['bind9']['masterrole']}",
     :keys => { 'hostname' => [ 'hostname' ],
                'network'  => [ 'network' ],
                'bind9' => ['bind9']
     })

  master_ipaddress = nil
  domains = Array.new
  m_ip = Array.new
  master_nodes.each do |matching_node|
    addr = get_ipaddress(:interface => node[:bind9][:mgn_int] ,:node => matching_node)
    if addr
      # bindview is an attribute come from the role internal or extenal that must be assosiated to the slave sarver
      node.normal['bind9']['servers'][addr]=view
      master_ipaddress = "#{master_ipaddress} #{addr};"
      m_ip << addr
    end
     matching_node['bind9']['id'][view]['master'].keys.each do |mdomains|
       domains << mdomains
     end
   end
  master_nodes[0]['bind9']['keys'][view].each do |k,v|
      node.normal[:bind9][:keys][view][k]=v
  end

#  node.normal[:bind9][:acl] = node["dt-env"]["bind"]["acl"]
  node.normal[:bind9][:opstions]['allow-notify'] = m_ip
  #Create the domains
  domains.sort.uniq.each do |domain|
    bind9_ng_zone domain do
        email "hostmaster.dt-hbs.com"
        nameserver node[:nameserver]
        type "slave"
        ip master_ipaddress
      end
  end
include_recipe 'bind9-ng::config'
