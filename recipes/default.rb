#
# Cookbook: confd-iptables
# License: Apache 2.0
#
# Copyright 2015, Bloomberg Finance L.P.
#
include_recipe 'iptables::default'

confd_template '/etc/confd/iptables.rules' do
  template_source node['confd-iptables']['template_source']
  prefix node['confd-iptables']['prefix']
  keys node.tags.map { |t| "/groups/#{t}" }

  check_command "/usr/sbin/iptables-restore -T confd -t #{path}"
  reload_command "/usr/sbin/iptables-restore -T confd #{path}"

  notifies :restart, 'confd_service[confd]', :delayed
  only_if { node['confd-iptables']['enable_iptables'] }
end

include_recipe 'confd::default'
