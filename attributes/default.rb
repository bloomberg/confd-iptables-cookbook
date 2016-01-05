#
# Cookbook: confd
# License: Apache 2.0
#
# Copyright 2015-2016, Bloomberg Finance L.P.
#
default['confd-iptables']['template_source'] = 'iptables.tmpl.erb'
default['confd-iptables']['prefix'] = '/'
default['confd-iptables']['keys'] = lazy do; node.tags.map { |t| "/#{t}" }; end # rubocop:disable Style/BlockDelimiters
