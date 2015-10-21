# confd-iptables-cookbook
Application cookbook which manages [iptables][1] rules using [confd][0].

## Basic Usage
The default recipe will install [confd][0], [iptables][1] and create a
iptables rules file which is created using a custom Chef resource
provided by the [confd cookbook][2]. The
[included template](templates/default/iptables.tmpl.erb) is what is
passed into confd to generate the iptables rules.

## Testing
A [fixture cookbook](test/fixture/cookbooks/test-confd-iptables) is
used to provide integration tests through Test Kitchen. These tests
can be invoked using `bin/kitchen test centos-71`. To see a list
of all the instances that we test on run `bin/kitchen list`.

[0]: https://github.com/kelseyhightower/confd
[1]: https://en.wikipedia.org/wiki/Iptables
[2]: https://github.com/johnbellone/confd-cookbook
