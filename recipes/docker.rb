#
# Cookbook Name:: ci-btb
# Recipe:: docker
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Configure docker on the host for test kitchen use

docker_installation_package 'default' do
  version '1.10.0'
  action :create
  package_options '--force-yes '\
                  "-o Dpkg::Options::='--force-confold' "\
                  "-o Dpkg::Options::='--force-all'"
end
