# == Class: coverage::dns
#
# DNS definitions for the coverage.net domain
#
class coverage::dns {
  include dns::server
  include coverage::dns::campbeltown
  include coverage::dns::highland
  include coverage::dns::island

  # Forwarders
  #dns::server::options{ '/etc/bind/named.conf.options':
  #  forwarders => [ '8.8.8.8', '8.8.4.4' ],
  #}

  file { '/etc/bind/named.conf.options':
    ensure => file,
    group  => bind,
    owner  => root,
    source => 'puppet:///modules/coverage/named.conf.options',
  }

  # Forward Zone
  dns::zone { 'coverage.net':
    soa         => 'ns1.coverage.net',
    soa_email   => 'admin.coverage.net',
    nameservers => ['ns1'],
  }

  # Reverse Zone
  dns::zone { '20.168.192.IN-ADDR.ARPA':
    soa         => 'ns1.coverage.net',
    soa_email   => 'admin.coverage.net',
    nameservers => ['ns1']
  }

  dns::record::a {
    'ns1':
      zone => 'coverage.net',
      data => ['127.0.0.1'];
  }
}
