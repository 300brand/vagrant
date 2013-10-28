network::interface{ 'eth1':
  address   => $eth1_ip,
  broadcast => $eth1_broadcast,
  network   => $eth1_network,
  notify    => Exec['eth1_up'],
}

exec { 'eth1_up':
  command => '/sbin/ifup eth1',
  creates => '/proc/sys/net/ipv4/neigh/eth1',
}

node 'glenscotia.dns.campbeltown.coverage.net' {
  # Help handle the chicken-and-the-egg issues by pre-installing bind before
  # the resolver module changes /etc/resolv.conf to point to a DNS server that
  # isn't built yet.
  package { 'bind9':
    ensure => installed,
  }
}

node 'default' {
  # Catch-all - do nothing.
}
