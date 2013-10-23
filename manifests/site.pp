include coverage::puppet

package { 'etckeeper':
  ensure => latest,
}

package { 'ntpdate':
  ensure => latest,
}

class { 'resolver':
  dns_servers => ['192.168.20.34'],
}

import 'nodes/*.pp'
