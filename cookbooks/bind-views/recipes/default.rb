#
# Cookbook Name:: bind-cache
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
  view "internal"
end

host = Hash.new
host['a'] = '2.2.3.4'
host['b'] = '2.2.3.5'
host['c'] = '2.2.3.11'
host['d'] = "c.#{node[:zone]}"

bind9_ng_zone node[:zone] do
  email "hostmaster.dt-hbs.com"
  nameserver node[:nameserver]
  hosts host
  mailserver node[:mailserver]
  view "external"
end

include_recipe 'bind9-ng::config'
