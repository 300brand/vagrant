# == Class: coverage::mongo::arbiter
#
# Arbiter - http://docs.mongodb.org/manual/tutorial/add-replica-set-arbiter/
#
# Arbiters are mongod instances that are part of replica set but do not hold
# data. Arbiters participate in elections in order to break ties. If a
# replica set has an even number of members, add an arbiter.
#
define coverage::mongo::arbiter (
    $replSet = $title,
    $port    = 27018,
  ) {

  $arbiter = "arbiter-${replSet}"

  file {
    "/var/lib/mongo-${arbiter}":
      ensure => directory,
      group  => mongodb,
      mode   => '0755',
      notify => Service["$arbiter"],
      owner  => mongodb;
    "/etc/${arbiter}.conf":
      ensure  => file,
      content => template('coverage/arbiter.conf.erb'),
      group   => root,
      notify  => Service["$arbiter"],
      owner   => root;
  }
  exec { "copy_arbiter_${replSet}":
    command => "/bin/bash /vagrant/modules/coverage/files/make_mongos.sh '${arbiter}'",
    creates => "/etc/init.d/${arbiter}",
    notify  => Service["$arbiter"],
    require => Class['mongodb'],
  }

  service { "$arbiter":
    ensure  => running,
    require => Exec["copy_arbiter_${replSet}"]
  }
}
