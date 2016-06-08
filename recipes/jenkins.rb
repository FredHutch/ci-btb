#
# Cookbook Name:: ci-btb
# Recipe:: jenkins
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'java'
include_recipe 'jenkins::master'

# Need to disable security

ruby_block "Security off" do
  block do
    Chef::Log.info "Waiting until Jenkins config.xml file is present"
    until File.exist?("#{node['jenkins']['master']['home']}/config.xml")
      sleep 1
      Chef::Log.debug('.')
    end

    Chef::Log.warn "Turning off useSecurity in #{node['jenkins']['master']['home']}/config.xml"
    fe = Chef::Util::FileEdit.new("#{node['jenkins']['master']['home']}/config.xml")
    fe.search_file_replace_line(/  <useSecurity>true<\/useSecurity>/,
                                "  <useSecurity>false<\/useSecurity>")
    fe.insert_line_if_no_match( /<bogus><\/bogus>/, "wheres waldo" )
    fe.write_file
  end
  action :run
  #notifies :restart, 'service[jenkins]', :immediately
end

# Jenkins plugins:
#
# ant
# branch api
# folders
# github branch source
# github 
# pipeline: rest api
# pipeline: stage view
# ssh credentials
# timestamper

jenkins_ssh_slave 'knife-wks' do
    description 'Build on local host'
    remote_fs   '/var/spool/btb/jenkins'
    labels      [ 'knife-wks' ]
    host        node['hostname']
    user        'btb'
    credentials 'btb'
end

