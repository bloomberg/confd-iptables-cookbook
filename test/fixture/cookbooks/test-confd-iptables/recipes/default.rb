node.tag('default')
node.tag('testing')

node.default['zookeeper-cluster']['config']['instance_name'] = 'localhost'
node.default['zookeeper-cluster']['config']['ensemble'] = %w{localhost}
include_recipe 'zookeeper-cluster::default'

# TODO: Write values here for database entries.

node.default['confd']['config']['backend'] = 'zookeeper'
node.default['confd']['config']['nodes'] = %w{localhost}
include_recipe 'confd-iptables::default'
