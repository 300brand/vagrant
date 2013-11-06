# == Class: coverage::mongos
#
# Creates a mongos instance off to the side of the normal mongod
#
class coverage::mongo::shell {
  # file {
  #   '/var/lib/mongos':
  #     ensure => directory,
  #     group  => mongodb,
  #     mode   => '0755',
  #     notify => Service['mongos'],
  #     owner  => mongodb;
  #   '/etc/mongos.conf':
  #     ensure  => file,
  #     content => template('coverage/mongos.conf.erb'),
  #     group   => root,
  #     notify  => Service['mongos'],
  #     owner   => root;
  # }

  # exec { 'copy_mongod_init':
  #   command => '/bin/bash /vagrant/modules/coverage/files/make_mongos.sh',
  #   creates => '/etc/init.d/mongos',
  #   notify  => Service['mongos'],
  #   require => Class['mongodb'],
  # }

  # service { 'mongos':
  #   ensure  => running,
  #   require => Exec['copy_mongod_init']
  # }

  file { '/etc/init.d/mongodb':
    ensure  => file,
    content => template('coverage/mongodb_initd.erb')
    group   => root,
    mode    => '0755',
    notify  => Service['mongodb'],
    owner   => root,
    require => Package['mongodb-10gen'],
  }

  class { 'mongodb':
    enable_10gen => true,
    configdb     => [
      'hazelburn.mongocfg.campbeltown.coverage.net',
      'oldpulteney.mongocfg.highland.coverage.net',
      'talisker.mongocfg.island.coverage.net',
    ],
    dbpath       => '/var/lib/mongodb',
    fork         => false,
    port         => 27017,
    syslog       => true,
  }
}
