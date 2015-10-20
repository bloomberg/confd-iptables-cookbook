require 'spec_helper'

describe 'confd-iptables::default' do
  context 'with default attributes' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04') do |node|
        node.tag('default')
        node.tag('testing')
      end.converge('confd-iptables::default')
    end

    it { expect(chef_run).to include_recipe('confd::default') }
    it { expect(chef_run).to create_directory('/etc/iptables') }
    it do
      expect(chef_run).to create_confd_template('/etc/iptables/confd')
        .with(template_source: 'iptables.tmpl.erb')
        .with(prefix: '/')
        .with(keys: %w{/groups/default /groups/testing})
        .with(check_command: '/sbin/iptables-restore -n -t < /etc/iptables/confd')
        .with(reload_command: '/sbin/iptables-restore -n < /etc/iptables/confd')
    end
  end
end
