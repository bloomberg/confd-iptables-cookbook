default['test-confd-iptables']['rules'] = [
  { protocol: 'tcp', port: 22, host: '127.0.0.1' },
  { protocol: 'tcp', port: 22, host: '127.0.1.1' },
  { protocol: 'tcp', port: 22, host: '127.0.2.1' },
  { protocol: 'tcp', port: 80, host: '127.0.1.1' },
  { protocol: 'tcp', port: 443, host: '127.0.1.1' },
  { protocol: 'tcp', port: 8080, host: '127.0.2.1' },
  { protocol: 'tcp', port: 8443, host: '127.0.2.1' }
]
