node /^\w+\.mongocfg\.\w+\.coverage\.net/ {
  include coverage::mongo::config
  include coverage::mongo::shell

  apt::repository { 'testing':
    url        => 'http://mirrors.kernel.org/debian/',
    distro     => 'testing',
    repository => 'main',
  }

  class { 'gearman':
    listen                => $ipaddress_eth1,
    disable_limits_module => true,
    require_epel          => [], # circumvents the undef issues in module
    require               => Apt::Repository['testing'],
  }
}
