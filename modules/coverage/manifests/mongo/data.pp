# == Class: coverage::mongod
#
# Configures a mongod instance running in configsvr mode
#
class coverage::mongo::data (
  $replSet = undef,
  $port    = 27017,
  ) {
  if $replSet == undef {
    fail('No replSet defined')
  }

  class { 'mongodb':
    enable_10gen => true,
    dbpath       => '/var/lib/mongodb',
    fork         => false,
    port         => $port,
    replset      => $replSet,
    rest         => true,
    notify       => Fstab['mongo_storage'],
    syslog       => true,
    # template  => 'coverage/mongod.conf.erb',
    # options   => {
    #   replSet => $replSet,
    #   port    => $port,
    # },
  }

  include coverage::mongo::mount
}
