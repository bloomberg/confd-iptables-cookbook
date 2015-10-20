#
# Cookbook: confd-iptables
# License: Apache 2.0
#
# Copyright 2015, Bloomberg Finance L.P.
#
include_recipe 'confd::default'

if platform_family?('rhel') && node['platform_version'].to_i == 7
  package 'iptables-services'
else
  package 'iptables'
end

directory node['confd-iptables']['target_directory'] do
  recursive true
end

confd_template File.join(node['confd-iptables']['target_directory'], 'confd') do
  template_source node['confd-iptables']['template_source']
  prefix node['confd-iptables']['prefix']
  keys node.tags.map { |t| "/groups/#{t}" }

  check_command "/sbin/iptables-restore -n -t < #{path}"
  reload_command "/sbin/iptables-restore -n < #{path}"

  notifies :restart, 'confd_service[confd]', :delayed
end
