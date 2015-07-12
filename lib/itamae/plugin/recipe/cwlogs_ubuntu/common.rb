# encoding: utf-8

node[:cwlogs] ||= {}

node[:cwlogs][:aws_access_key_id]     ||= ''
node[:cwlogs][:aws_secret_access_key] ||= ''
node[:cwlogs][:log_stream_name] ||= '{instance_id}'
node[:cwlogs][:root_dir]        ||= '/opt/aws/cloudwatch'
node[:cwlogs][:config_path]     ||= '/tmp/awslogs.conf'
node[:cwlogs][:logfiles]        ||= {
  'syslog' => '/var/log/syslog',
}
node[:cwlogs][:region]           ||= 'ap-northeast-1'
node[:cwlogs][:logstream_prefix] ||= 'logstream'
