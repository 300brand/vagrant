# == Class: coverage::mongocfg
#
# Configures a mongod instance running in configsvr mode
#
class coverage::mongocfg {
  class { 'mongodb':
    use_10gen => true,
    template  => 'coverage/mongocfg.conf.erb',
  }

  file { '/var/lib/mongocfg':
    ensure => directory,
    group  => mongodb,
    mode   => '0755',
    notify => Service['mongodb'],
    owner  => mongodb,
  }
}
