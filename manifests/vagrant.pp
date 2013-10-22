# Vagrant bootstrap configuration. Once run, puppet agent takes over to manage
# further configuration and setup
include coverage::puppet
import 'nodes/*.pp'

package { 'etckeeper':
  ensure => installed,
}

package { 'ntpdate':
  ensure => installed,
}

network::interface{ 'eth1':
  address   => $eth1_ip,
  broadcast => $eth1_broadcast,
  network   => $eth1_network,
}

class { 'dnsclient':
  nameservers => ['192.168.20.34'],
}

