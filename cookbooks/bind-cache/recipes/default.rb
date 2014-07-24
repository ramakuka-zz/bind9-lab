#
# Cookbook Name:: bind-cache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'bind9::install_bind'
include_recipe 'bind9::config'
