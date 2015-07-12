# encoding: utf-8

directory "/var/awslogs"
directory "/var/awslogs/state"
directory "/var/awslogs/etc"

template "create /tmp/awslogs.conf" do
  path   "#{node[:cwlogs][:config_path]}"
  source "templates/default/awslogs.cfg.erb"
  owner  "root"
  group  "root"
  mode   "0644"
  not_if "test -f /var/awslogs/etc/awslogs.conf"
end

template "create awslogs.conf" do
  path   "/var/awslogs/etc/awslogs.conf"
  source "templates/default/awslogs.cfg.erb"
  owner  "root"
  group  "root"
  mode   "0644"
end

template "/var/awslogs/etc/aws.conf" do
  source "templates/default/aws.conf.erb"
  owner  "root"
  group  "root"
  mode   "0600"
end