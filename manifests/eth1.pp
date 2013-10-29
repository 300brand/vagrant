network::interface{ 'eth1':
  address   => $eth1_ip,
  broadcast => $eth1_broadcast,
  network   => $eth1_network,
  notify    => Exec['eth1_up'],
}

# Damn DHCP'd eth0 taking over /etc/resolv.conf...
network::interface{ 'eth0':
  address   => '10.0.2.15',
  broadcast => '10.0.2.255',
  network   => '10.0.2.0',
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
