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
    it { expect(chef_run).to create_directory('/etc/default') }
    it do
      expect(chef_run).to create_confd_template('/etc/default/iptables')
        .with(template_source: 'iptables.tmpl.erb')
        .with(prefix: '/')
        .with(keys: %w{/default /testing})
        .with(check_command: '/sbin/iptables-restore -t < /etc/default/iptables')
        .with(reload_command: '/sbin/iptables-restore < /etc/default/iptables')
    end
  end
end
