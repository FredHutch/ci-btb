#
# Cookbook Name:: ci-btb
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
include_recipe 'apt-chef::stable'
package %w(chefdk git) do
  action :install
end

gem_package 'knife-supermarket' do
  gem_binary('/opt/chefdk/embedded/bin/gem')
  options('--no-user-install')
end

include_recipe 'java'
