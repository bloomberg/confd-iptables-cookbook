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
  it { should have_rule('-P INPUT ACCEPT') }
  it { should have_rule('-P FORWARD ACCEPT') }
  it { should have_rule('-P OUTPUT ACCEPT') }
  it { should have_rule('-A INPUT -m state --state ESTABLISHED -j ACCEPT') }
  it { should have_rule('-A INPUT -m state --state RELATED -j ACCEPT') }
  it { should have_rule('-A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT') }
  it { should have_rule('-A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT') }
  it { should have_rule('-A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 22 -j DEFAULT') }
  it { should have_rule('-A INPUT -s 127.0.1.1/32 -p tcp -m tcp --dport 22 -j DEFAULT') }
  it { should have_rule('-A INPUT -s 127.0.2.1/32 -p tcp -m tcp --dport 22 -j DEFAULT') }
  it { should have_rule('-A INPUT -s 127.0.1.1/32 -p tcp -m tcp --dport 80 -j DEFAULT') }
  it { should have_rule('-A INPUT -s 127.0.1.1/32 -p tcp -m tcp --dport 443 -j DEFAULT') }
  it { should have_rule('-A OUTPUT -d 127.0.2.1/32 -p tcp -m tcp --dport 8080 -j DEFAULT') }
  it { should have_rule('-A OUTPUT -d 127.0.2.1/32 -p tcp -m tcp --dport 8443 -j DEFAULT') }
  it { should have_rule('-A INPUT -j DROP') }
end
