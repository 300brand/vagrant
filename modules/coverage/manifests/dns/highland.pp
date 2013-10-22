# == Class: coverage::dns::highland
#
# DNS definitions for the Highland physical and virtual machines
#
class coverage::dns::highland {
  dns::record::a {
    'highland':
      zone => 'coverage.net',
      data => ['192.168.20.18'],
      ptr  => true;
    'glenmorangie.mongo.highland':
      zone => 'coverage.net',
      data => ['192.168.20.40'],
      ptr  => true;
    'themacallan.mongo.highland':
      zone => 'coverage.net',
      data => ['192.168.20.41'],
      ptr  => true;
    'oldpulteney.mongocfg.highland':
      zone => 'coverage.net',
      data => ['192.168.20.39'],
      ptr  => true;
  }
}
