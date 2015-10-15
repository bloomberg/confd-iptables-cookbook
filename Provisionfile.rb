require 'chef/provisioning/vagrant_driver'

vagrant_box 'bento/ubuntu-14.04' do
  url 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box'
end

with_machine_options('vagrant_options' => {
  'vm.box' => 'bento/ubuntu-14.04'
})

machine 'test' do
  recipe 'confd-iptables::default'
  tag 'default'
  converge true
end
