node 'kilkerran.puppetmaster.campbeltown.coverage.net' {
  package { 'puppetmaster':
    ensure => installed,
  }
  ->
  file {
    'puppetmaster_manifests':
      ensure => link,
      force  => true,
      path   => '/etc/puppet/manifests',
      target => '/vagrant/manifests';
    'puppetmaster_modules':
      ensure => link,
      force  => true,
      path   => '/etc/puppet/modules',
      target => '/vagrant/modules';
  }
  ->
  service { 'puppetmaster':
    ensure => running,
  }
}
