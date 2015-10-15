name 'confd-iptables'
run_list 'confd-iptables::default'
default_source :community
cookbook 'confd-iptables', path: '.'
