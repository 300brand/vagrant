# == Class: coverage::dns::island
#
# DNS definitions for the Island physical and virtual machines
#
class coverage::dns::island {
  dns::record::a {
    'island':
      zone => 'coverage.net',
      data => ['192.168.20.19'],
      ptr  => true;
    'highlandpark.mongo.island':
      zone => 'coverage.net',
      data => ['192.168.20.44'],
      ptr  => true;
    'ledaig.mongo.island':
      zone => 'coverage.net',
      data => ['192.168.20.43'],
      ptr  => true;
    'talisker.mongocfg.island':
      zone => 'coverage.net',
      data => ['192.168.20.42'],
      ptr  => true;
  }
}
