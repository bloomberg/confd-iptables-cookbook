require 'spec_helper'

describe 'confd-iptables::default' do
  context 'with default attributes' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04') do |node|
        node.tag('default')
        node.tag('web')
      end.converge('confd-iptables::default')
    end

    it { expect(chef_run).to include_recipe('iptables::default') }
    it { expect(chef_run).to include_recipe('confd::default') }
    it do
      expect(chef_run).to create_confd_template('/etc/confd/iptables.rules')
        .with(template_source: 'iptables.tmpl.erb')
        .with(prefix: '/')
        .with(keys: %w{/groups/default /groups/web})
        .with(check_command: '/usr/sbin/iptables-restore -T confd -t /etc/confd/iptables.rules')
        .with(reload_command: '/usr/sbin/iptables-restore -T confd /etc/confd/iptables.rules')
    end
  end
end
