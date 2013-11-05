# == Class: coverage::mongocfg
#
# Configures a mongod instance running in configsvr mode
#
class coverage::mongo::config {
  class { 'mongodb':
    enable_10gen => true,
    configsvr    => true,
    dbpath       => '/var/lib/mongodb',
    fork         => false,
    port         => 27019,
    rest         => true,
    smallfiles   => true,
    syslog       => true,
    #template  => 'coverage/mongocfg.conf.erb',
  }
}
