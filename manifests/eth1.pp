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
