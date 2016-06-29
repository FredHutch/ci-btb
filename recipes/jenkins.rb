#
# Cookbook Name:: ci-btb
# Recipe:: jenkins
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'chef-vault'
keys = chef_vault_item('jenkins', 'keys')

include_recipe 'jenkins::master'

# Add jenkins user to docker group
group 'docker' do
  append true
  members 'jenkins'
  action :modify
  notifies :restart, 'service[jenkins]', :delayed
end

# Configure jenkins user for security
#jenkins_user 'chef' do
#  public_keys [keys['pubkey']]
#end

node.run_state['jenkins_private_key'] = keys['privkey']

# Jenkins plugins:
#
#jenkins_plugin 'credentials'
#jenkins_plugin 'ant'
#jenkins_plugin 'ssh-credentials'
#jenkins_plugin 'ssh-slaves'
#jenkins_plugin 'branch-api'
#jenkins_plugin 'github'
#jenkins_plugin 'github-branch-source'
#jenkins_plugin 'github-oauth'
#jenkins_plugin 'timestamper'
# NB: this currently doesn't seem to be installing plugins-
#     its necessary to log into jenkins and go to the
#     plugin manager page to complete this step
# These cause errors:
# jenkins_plugin 'workflow-aggregator '
# jenkins_plugin 'cloudbees-folders'
