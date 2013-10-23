# == Class: coverage::mongocfg
#
# Configures a mongod instance running in configsvr mode
#
class coverage::mongo::config {
  include coverage::workingdir

  file { 'mongocfg_dir':
    ensure  => directory,
    group   => mongodb,
    mode    => '0755',
    owner   => mongodb,
    path    => "/vagrant/${::fqdn}/mongocfg",
    require => File['workingdir'],
  }

  class { 'mongodb':
    require   => File['mongocfg_dir']
    template  => 'coverage/mongocfg.conf.erb',
    use_10gen => true,
  }
}
