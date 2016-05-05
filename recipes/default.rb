#
# Cookbook Name:: ci-btb
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
include_recipe 'apt::default'
include_recipe 'apt-chef::stable'

apt_repository 'octopus_fhcrc' do
    uri             'http://octopus.fhcrc.org/fhcrc/ubuntu'
    distribution    "#{node['lsb']['codename']}"
    key             'http://octopus.fhcrc.org/fhcrc/ubuntu/scicomp.gpg.key'
    components      [ 'main' ]
    arch            'amd64'
    deb_src         false
end

package [ 'chefdk' ] do
    action :install
end

gem_package 'knife-supermarket' do
    gem_binary '/opt/chefdk/embedded/bin/gem'
end

user 'btb' do
    comment 'Bob the Builder Automation User'
    home '/var/spool/btb'
    shell '/bin/bash'
end


#execute 'add local supermarket certs' do
#    command "knife ssl fetch #{node['supermarket_uri']}"
#    not_if "knife ssl check #{node['supermarket_uri']}"
#end

