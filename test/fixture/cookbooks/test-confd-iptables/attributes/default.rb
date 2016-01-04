default['test-confd-iptables']['rules']['default'] = [
  { protocol: 'tcp', port: 22, address: '127.0.0.1', direction: 'in' },
  { protocol: 'tcp', port: 22, address: '127.0.1.1', direction: 'in' },
  { protocol: 'tcp', port: 22, address: '127.0.2.1', direction: 'in' },
  { protocol: 'tcp', port: 80, address: '127.0.1.1', direction: 'in' },
  { protocol: 'tcp', port: 443, address: '127.0.1.1', direction: 'in' },
  { protocol: 'tcp', port: 8080, address: '127.0.2.1', direction: 'in' },
  { protocol: 'tcp', port: 8443, address: '127.0.2.1', direction: 'in' }
]

default['test-confd-iptables']['rules']['testing'] = [
  { protocol: 'tcp', port: 514, address: '33.0.0.1', direction: 'in' }
]
