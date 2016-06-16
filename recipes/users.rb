#
# Cookbook Name:: ci-btb
# Recipe:: users
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

user 'btb' do
  supports manage_home: true
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
