#
# Cookbook Name:: ci-btb
# Recipe:: jenkins
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'java'
include_recipe 'jenkins::master'

# Jenkins plugins:
#
jenkins_plugin 'ant'
jenkins_plugin 'credentials'
jenkins_plugin 'ssh-credentials'
jenkins_plugin 'ssh-slaves'
jenkins_plugin 'branch-api'
jenkins_plugin 'github'
jenkins_plugin 'github-branch-source'
jenkins_plugin 'timestamper'
# These cause errors:
#jenkins_plugin 'workflow-aggregator '
#jenkins_plugin 'cloudbees-folders'

