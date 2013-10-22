# == Class: coverage::puppet
#
# Sets up puppet agent and configures it to connect to the puppet master
#
# === Examples
#
#  include coverage::puppet
#
class coverage::puppet {
  package { 'puppet':
    ensure => installed,
  }

  file { 'puppet.conf':
    ensure  => file,
    path    => '/etc/puppet/puppet.conf',
    require => Package['puppet'],
    content => template('coverage/puppet.conf.erb'),
  }

  file { 'puppet_initd':
    ensure  => file,
    path    => '/etc/default/puppet',
    require => Package['puppet'],
    content => 'puppet:///modules/coverage/puppet_initd',
  }

  service { 'puppet':
    ensure => running,
  }
}
