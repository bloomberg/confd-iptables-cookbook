node.default['build-essential']['compile_time'] = true
include_recipe 'build-essential::default'

include_recipe 'chef-sugar::default'

node.tag('default')
node.untag('testing')

node.default['zookeeper-cluster']['config']['instance_name'] = 'localhost'
node.default['zookeeper-cluster']['config']['ensemble'] = %w{localhost}
include_recipe 'zookeeper-cluster::default'

chef_gem 'zk'
require_chef_gem 'zk'
ruby_block 'write to zk' do
  block do
    zk = ZK.new
    zk.create('/testing', node['test-confd-iptables']['rules']['testing'].to_json, mode: :persistent, ignore: :node_exists, or: :set)
    zk.create('/default', node['test-confd-iptables']['rules']['default'].to_json, mode: :persistent, ignore: :node_exists, or: :set)
  end
end

node.default['confd']['config']['backend'] = 'zookeeper'
node.default['confd']['config']['nodes'] = %w{localhost}
node.default['confd']['config']['interval'] = 60
include_recipe 'confd-iptables::default'
