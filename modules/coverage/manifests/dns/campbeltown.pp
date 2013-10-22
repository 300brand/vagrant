# == Class: coverage::dns::campbeltown
#
# DNS definitions for the Campbeltown physical and virtual machines
#
class coverage::dns::campbeltown {
  dns::record::a{
    'campbeltown':
      zone => 'coverage.net',
      data => ['192.168.20.17'],
      ptr  => true;
    'campbeltown.stats.campbeltown':
      zone => 'coverage.net',
      data => ['192.168.20.35'],
      ptr  => true;
    'glenscotia.dns.campbeltown':
      zone => 'coverage.net',
      data => ['192.168.20.34'],
      ptr  => true;
    'hazelburn.mongocfg.campbeltown':
      zone => 'coverage.net',
      data => ['192.168.20.36'],
      ptr  => true;
    'kilkerran.puppetmaster.campbeltown':
      zone => 'coverage.net',
      data => ['192.168.20.33'],
      ptr  => true;
    'longrow.mongo.campbeltown':
      zone => 'coverage.net',
      data => ['192.168.20.37'],
      ptr  => true;
    'springbank.mongo.campbeltown':
      zone => 'coverage.net',
      data => ['192.168.20.38'],
      ptr  => true;
  }
}
