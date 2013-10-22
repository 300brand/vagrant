# == Class: coverage::mongocfg
#
# Configures a mongod instance running in configsvr mode
#
class coverage::mongocfg {
  class { 'mongodb':
    enable_10gen => true,
  }

  file { '/var/lib/mongocfg':
    ensure => directory,
    group  => mongodb,
    owner  => mongodb,
    mode   => '0755',
  }
  ->
  file { '/etc/mongodb.conf':
    ensure  => file,
    content => template('coverage/mongocfg.conf.erb'),
    notify  => Service['mongodb'],
  }
}
