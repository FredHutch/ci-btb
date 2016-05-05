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

package [ 'chefdk', 'git' ] do
    action :install
end

gem_package 'knife-supermarket' do
    gem_binary('/opt/chefdk/embedded/bin/gem')
    options('--no-user-install')
end

user 'btb' do
    supports :manage_home => true
    comment 'Bob the Builder Automation User'
    home '/var/spool/btb'
    shell '/bin/bash'
end

directory '/var/spool/btb/.chef' do
    owner 'btb'
    mode '0700'
end

template '/var/spool/btb/.chef/knife.rb' do
    source 'knife.rb.erb'
    owner 'btb'
    mode '0644'
end

include_recipe 'jenkins::master'

#execute 'add local supermarket certs' do
#    command "knife ssl fetch #{node['supermarket_uri']}"
#    not_if "knife ssl check #{node['supermarket_uri']}"
#end

