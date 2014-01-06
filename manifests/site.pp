include coverage::puppet
include coverage::collectd

package { 'etckeeper':
  ensure => latest,
}

package { 'ntp':
  ensure => latest,
}

class { 'resolver':
  dns_domain  => 'coverage.net',
  dns_servers => ['192.168.20.17', '192.168.20.21'],
}

import 'nodes/*.pp'
