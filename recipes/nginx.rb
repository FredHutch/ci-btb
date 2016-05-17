#
# Cookbook Name:: ci-btb
# Recipe:: nginx
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
directory '/var/www' do
    action :create
    owner 'www-data'
    mode '0755'
end

directory '/var/www/apps' do
    action :create
    owner 'www-data'
    mode '0755'
end

include_recipe 'nginx::default'
