require 'serverspec'
set :backend, :exec

describe file('/etc/default/iptables') do
  it { should be_file }
end

describe iptables do
  it { should have_rule('-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT') }
  it { should have_rule('-A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT') }
  it { should have_rule('-A INPUT -i lo -j ACCEPT') }
  it { should have_rule('-A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT') }
end
