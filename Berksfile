source 'https://supermarket.chef.io'
metadata

group :test, :integration do
  cookbook 'java', git: 'https://github.com/agileorbit-cookbooks/java'
  cookbook 'test-confd-iptables', path: 'test/fixture/cookbooks/test-confd-iptables'
  cookbook 'zookeeper-cluster'
end
