# == Class: coverage::mongos
#
# Creates a mongos instance off to the side of the normal mongod
#
class coverage::mongos {
  file {
    '/var/lib/mongos':
      ensure => directory,
      group  => mongodb,
      mode   => '0755',
      notify => Service['mongos'],
      owner  => mongodb;
    '/etc/mongos.conf':
      ensure  => file,
      content => template('coverage/mongos.conf.erb'),
      group   => root,
      notify  => Service['mongos'],
      owner   => root;
  }

  exec { 'copy_mongod_init':
    command => '/bin/bash /vagrant/modules/coverage/files/make_mongos.sh',
    creates => '/etc/init.d/mongos',
    notify  => Service['mongos'],
  }

  service { 'mongos':
    ensure => running,
  }
}
# mongos --configdb config0.coverage.net:27019,
#                   config1.coverage.net:27019,
#                   config2.coverage.net:27019
#        --port 27018
#        --bind_ip 192.168.20.20
