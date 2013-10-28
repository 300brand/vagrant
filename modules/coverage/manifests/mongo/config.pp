# == Class: coverage::mongocfg
#
# Configures a mongod instance running in configsvr mode
#
class coverage::mongo::config {
  include coverage::mongo::mount

  class { 'mongodb':
    use_10gen => true,
    before    => Fstab['mongo_storage'],
    template  => 'coverage/mongocfg.conf.erb',
  }
}
