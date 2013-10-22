include coverage::puppet

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

node 'glenscotia.dns.campbeltown.coverage.net' {
  include coverage::dns
}

node 'kilkerran.puppetmaster.campbeltown.coverage.net' {
  package { 'puppetmaster':
    ensure => installed,
  }
  ->
  file {
    'puppetmaster_manifests':
      ensure => link,
      force  => true,
      path   => '/etc/puppet/manifests',
      target => '/vagrant/manifests';
    'puppetmaster_modules':
      ensure => link,
      force  => true,
      path   => '/etc/puppet/modules',
      target => '/vagrant/modules';
  }
  ->
  service { 'puppetmaster':
    ensure => running,
  }
}
