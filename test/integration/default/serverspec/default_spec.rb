require 'serverspec'
set :backend, :exec

describe service('confd') do
  it { should be_enabled }
  it { should be_running }
end

describe service('zookeeper') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/default/iptables') do
  it { should be_file }
end

describe iptables do
  it { should have_rule('-P INPUT DROP') }
  it { should have_rule('-P FORWARD ACCEPT') }
  it { should have_rule('-P OUTPUT ACCEPT') }
  it { should have_rule('-A INPUT -m state --state ESTABLISHED -j ACCEPT') }
  it { should have_rule('-A INPUT -m state --state RELATED -j ACCEPT') }
  it { should have_rule('-A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT') }
  it { should have_rule('-A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT') }
  it { should have_rule('-N DEFAULT') }
  it { should have_rule('-N TESTING') }
  it { should have_rule('-A INPUT -j DEFAULT') }
  it { should have_rule('-A INPUT -j TESTING') }
  it { should have_rule('-A TESTING -s 33.0.0.1/32 -p tcp -m tcp --dport 514 -j ACCEPT') }
  it { should have_rule('-A DEFAULT -s 127.0.0.1/32 -p tcp -m tcp --dport 22 -j ACCEPT') }
  it { should have_rule('-A DEFAULT -s 127.0.1.1/32 -p tcp -m tcp --dport 22 -j ACCEPT') }
  it { should have_rule('-A DEFAULT -s 127.0.2.1/32 -p tcp -m tcp --dport 22 -j ACCEPT') }
  it { should have_rule('-A DEFAULT -s 127.0.1.1/32 -p tcp -m tcp --dport 80 -j ACCEPT') }
  it { should have_rule('-A DEFAULT -s 127.0.1.1/32 -p tcp -m tcp --dport 443 -j ACCEPT') }
  it { should have_rule('-A DEFAULT -s 127.0.2.1/32 -p tcp -m tcp --dport 8080 -j ACCEPT') }
  it { should have_rule('-A DEFAULT -s 127.0.2.1/32 -p tcp -m tcp --dport 8443 -j ACCEPT') }
end
