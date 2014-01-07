# == Class: coverage::dns::all
#
# DNS definitions for all physical and virtual machines
#
# Generated by Vagrantfile
#
class coverage::dns::all {
  dns::record::a{
    'campbeltown':
      zone => 'coverage.net',
      data => ['192.168.20.17'],
      ptr  => true;
    'hazelburn.mongocfg.campbeltown':
      zone => 'coverage.net',
      data => ['192.168.20.33'],
      ptr  => true;
    'campbeltown.mongo.campbeltown':
      zone => 'coverage.net',
      data => ['192.168.20.34'],
      ptr  => true;
    'glenscotia.mongo.campbeltown':
      zone => 'coverage.net',
      data => ['192.168.20.35'],
      ptr  => true;
    'kilkerran.mongo.campbeltown':
      zone => 'coverage.net',
      data => ['192.168.20.36'],
      ptr  => true;
    'longrow.mongo.campbeltown':
      zone => 'coverage.net',
      data => ['192.168.20.37'],
      ptr  => true;
    'springbank.node.campbeltown':
      zone => 'coverage.net',
      data => ['192.168.20.38'],
      ptr  => true;
    'glengyle.node.campbeltown':
      zone => 'coverage.net',
      data => ['192.168.20.53'],
      ptr  => true;
    'highland':
      zone => 'coverage.net',
      data => ['192.168.20.18'],
      ptr  => true;
    'dalwhinnie.mongo.highland':
      zone => 'coverage.net',
      data => ['192.168.20.39'],
      ptr  => true;
    'fettercairn.node.highland':
      zone => 'coverage.net',
      data => ['192.168.20.40'],
      ptr  => true;
    'glenmorangie.mongo.highland':
      zone => 'coverage.net',
      data => ['192.168.20.41'],
      ptr  => true;
    'glenturret.node.highland':
      zone => 'coverage.net',
      data => ['192.168.20.42'],
      ptr  => true;
    'oldpulteney.mongocfg.highland':
      zone => 'coverage.net',
      data => ['192.168.20.43'],
      ptr  => true;
    'thedalmore.mongo.highland':
      zone => 'coverage.net',
      data => ['192.168.20.44'],
      ptr  => true;
    'themacallan.mongo.highland':
      zone => 'coverage.net',
      data => ['192.168.20.45'],
      ptr  => true;
    'island':
      zone => 'coverage.net',
      data => ['192.168.20.19'],
      ptr  => true;
    'arran.node.island':
      zone => 'coverage.net',
      data => ['192.168.20.46'],
      ptr  => true;
    'highlandpark.mongo.island':
      zone => 'coverage.net',
      data => ['192.168.20.47'],
      ptr  => true;
    'isleofjura.mongo.island':
      zone => 'coverage.net',
      data => ['192.168.20.48'],
      ptr  => true;
    'ledaig.mongo.island':
      zone => 'coverage.net',
      data => ['192.168.20.49'],
      ptr  => true;
    'scapa.node.island':
      zone => 'coverage.net',
      data => ['192.168.20.50'],
      ptr  => true;
    'talisker.mongocfg.island':
      zone => 'coverage.net',
      data => ['192.168.20.51'],
      ptr  => true;
    'tobermory.mongo.island':
      zone => 'coverage.net',
      data => ['192.168.20.52'],
      ptr  => true;
    'lowland':
      zone => 'coverage.net',
      data => ['192.168.20.20'],
      ptr  => true;
    'ailsabay.stats.lowland':
      zone => 'coverage.net',
      data => ['192.168.20.20'],
      ptr  => false;
    'annandale.dns.lowland':
      zone => 'coverage.net',
      data => ['192.168.20.20'],
      ptr  => false;
    'islay':
      zone => 'coverage.net',
      data => ['192.168.20.21'],
      ptr  => true;
    'ardbeg.dns.islay':
      zone => 'coverage.net',
      data => ['192.168.20.21'],
      ptr  => false;
  }
}
