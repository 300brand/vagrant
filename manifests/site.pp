include coverage::puppet

package { 'etckeeper':
  ensure => latest,
}

package { 'ntpdate':
  ensure => latest,
}

stage { post: }
Stage['main'] -> Stage['post']

class { 'resolver':
  dns_domain  => 'coverage.net',
  dns_servers => ['192.168.20.34'],
  stage       => 'post',
}

import 'nodes/*.pp'
