# == Class: coverage::dns::all
#
# DNS definitions for all physical and virtual machines
#
class coverage::dns::all {
  dns::record::a{
    'sable.localhost':
      zone => 'coverage.net',
      data => ['192.168.20.17'],
      ptr  => true;
    'campbeltown.stats.campbeltown':
      zone => 'coverage.net',
      data => ['192.168.20.33'],
      ptr  => true;
    'glenscotia.dns.campbeltown':
      zone => 'coverage.net',
      data => ['192.168.20.34'],
      ptr  => true;
    'hazelburn.mongocfg.campbeltown':
      zone => 'coverage.net',
      data => ['192.168.20.35'],
      ptr  => true;
    'kilkerran.puppetmaster.campbeltown':
      zone => 'coverage.net',
      data => ['192.168.20.36'],
      ptr  => true;
    'longrow.mongo.campbeltown':
      zone => 'coverage.net',
      data => ['192.168.20.37'],
      ptr  => true;
    'springbank.mongo.campbeltown':
      zone => 'coverage.net',
      data => ['192.168.20.38'],
      ptr  => true;
    'highland':
      zone => 'coverage.net',
      data => ['192.168.20.18'],
      ptr  => true;
    'glenmorangie.mongo.highland':
      zone => 'coverage.net',
      data => ['192.168.20.39'],
      ptr  => true;
    'themacallan.mongo.highland':
      zone => 'coverage.net',
      data => ['192.168.20.40'],
      ptr  => true;
    'oldpulteney.mongocfg.highland':
      zone => 'coverage.net',
      data => ['192.168.20.41'],
      ptr  => true;
    'island':
      zone => 'coverage.net',
      data => ['192.168.20.19'],
      ptr  => true;
    'highlandpark.mongo.island':
      zone => 'coverage.net',
      data => ['192.168.20.42'],
      ptr  => true;
    'ledaig.mongo.island':
      zone => 'coverage.net',
      data => ['192.168.20.43'],
      ptr  => true;
    'talisker.mongocfg.island':
      zone => 'coverage.net',
      data => ['192.168.20.44'],
      ptr  => true;
  }
}
