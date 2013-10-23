# == Class: coverage::mongod
#
# Configures a mongod instance running in configsvr mode
#
class coverage::mongo::data ($replSet = undef) {
  if $replSet == undef {
    fail('No replSet defined')
  }

  include coverage::mongo::mount

  class { 'mongodb':
    use_10gen => true,
    template  => 'coverage/mongod.conf.erb',
    options   => {
      replSet => $replSet,
    },
    require   => Fstab['mongo_storage'],
  }
}
