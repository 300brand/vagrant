node /^\w+\.mongocfg\.\w+\.coverage\.net/ {
  include coverage::mongo::config
  include coverage::mongo::shell

  if $fqdn == 'hazelburn.mongocfg.campbeltown.coverage.net' {
    coverage::mongo::arbiter {
      'rs0':
        port => 27020;
      'rs1':
        port => 27021;
      'rs2':
        port => 27022;
      'rs3':
        port => 27023;
    }
  }

  class { 'gearman':
    listen                => $ipaddress_eth1,
    disable_limits_module => true,
  }
}
