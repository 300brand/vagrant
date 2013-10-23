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
    ensure => latest,
  }

  file { 'puppet.conf':
    ensure  => file,
    content => template('coverage/puppet.conf.erb'),
    group   => root,
    notify  => Service['puppet'],
    owner   => root,
    path    => '/etc/puppet/puppet.conf',
    require => Package['puppet'],
  }

  file { 'puppet_initd':
    ensure  => file,
    group   => root,
    notify  => Service['puppet'],
    owner   => root,
    path    => '/etc/default/puppet',
    require => Package['puppet'],
    source  => 'puppet:///modules/coverage/puppet_initd',
  }

  service { 'puppet':
    ensure => running,
  }
}
