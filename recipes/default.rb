#
# Cookbook Name:: ci-btb
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
include_recipe 'ci-btb::packages'
include_recipe 'ci-btb::users'
include_recipe 'ci-btb::nginx'
include_recipe 'ci-btb::jenkins'

# execute 'add local supermarket certs' do
#    command "knife ssl fetch #{node['supermarket_uri']}"
#    not_if "knife ssl check #{node['supermarket_uri']}"
# end
