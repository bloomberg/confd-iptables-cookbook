#
# Cookbook: confd-iptables
# License: Apache 2.0
#
# Copyright 2015, Bloomberg Finance L.P.
#
node.default['confd']['config']['interval'] = 60
include_recipe 'confd::default'
include_recipe 'iptables::default'

confd_template '/etc/iptables.d/confd' do
  template_source node['confd-iptables']['template_source']
  prefix node['confd-iptables']['prefix']
  keys node.tags.map { |t| "/groups/#{t}" }

  check_command "/sbin/iptables-restore -n -t < #{path}"
  reload_command "/sbin/iptables-restore -n < #{path}"

  notifies :restart, 'confd_service[confd]', :delayed
end
