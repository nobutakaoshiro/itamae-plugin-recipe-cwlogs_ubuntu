# encoding: utf-8
include_recipe 'cwlogs_ubuntu::common'
include_recipe 'cwlogs_ubuntu::config'

directory "#{node[:cwlogs][:root_dir]}"
directory "/var/log/aws"
directory "/var/log/aws/cwlogs"

execute "download awslogs-agent setup script" do
  cwd     "#{node[:cwlogs][:root_dir]}"
  command "wget https://s3.amazonaws.com/aws-cloudwatch/downloads/latest/awslogs-agent-setup.py"
  not_if  "test -f #{node[:cwlogs][:root_dir]}/awslogs-agent-setup.py"
end

execute "chmod awslogs-agent" do
  command "chmod 755 #{node[:cwlogs][:root_dir]}/awslogs-agent-setup.py"
  only_if "test -f #{node[:cwlogs][:root_dir]}/awslogs-agent-setup.py"
end

execute "install awslogs-agent" do
  command "#{node[:cwlogs][:root_dir]}/awslogs-agent-setup.py -n --region #{node[:cwlogs][:region]} -c #{node[:cwlogs][:config_path]}"
  not_if  "service awslogs status"
end
