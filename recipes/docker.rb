#
# Cookbook Name:: ci-btb
# Recipe:: docker
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Configure docker on the host for test kitchen use

include_recipe 'chef-vault'
config = chef_vault_item('docker', 'config')

include_recipe 'chef-apt-docker'

docker_installation_package 'default' do
  version '1.10.0'
  action :create
  package_options '--force-yes ' \
                  "-o Dpkg::Options::='--force-confold' " \
                  "-o Dpkg::Options::='--force-all'"
end

group 'docker' do
  append true
  members 'btb'
  action :modify
end

service 'jenkins' do
  action :nothing
end

gem_package 'kitchen-docker' do
  gem_binary('/opt/chefdk/embedded/bin/gem')
  options('--no-user-install')
end

docker_registry config['registry_url'] do
  username config['username']
  password config['password']
  email config['email']
end
