node /^\w+\.mongocfg\.\w+\.coverage\.net/ {
  include coverage::mongo::config
  include coverage::mongo::shell

  class { 'gearman':
    listen                => $ipaddress_eth1,
    disable_limits_module => true,
    require_epel          => [], # circumvents the undef issues in module
  }
}
