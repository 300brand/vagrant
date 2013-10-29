# Class: coverage::service
#
# Maintains the coverage service at the latest version
#
class coverage::service (
  ){
  $gopath = '/usr/share/go'
  $gobin = '/usr/local/go/bin'

  file {
    $gopath:
      ensure => directory,
      mode   => '0755',
      notify => File['/etc/profile.d/gopath.sh'];
    '/etc/profile.d/gopath.sh':
      ensure  => file,
      content => template('coverage/gopath.sh.erb');
    '/etc/coverage.toml':
      ensure  => file,
      content => template('coverage/coverage.toml.erb');
    '/etc/init.d/coverageservices':
      ensure  => file,
      content => template('coverage/coverage_initd.erb'),
      mode    => '0755';
  }

  vcsrepo { 'coverage':
    ensure   => latest,
    notify   => Exec['recompile'],
    path     =>"${gopath}/src/github.com/300brand/coverage",
    provider => git,
    source   => 'git://github.com/300brand/coverage.git',
    tag      => 'gocode',
  }

  vcsrepo { 'coverageservices':
    ensure   => latest,
    notify   => Exec['recompile'],
    path     =>"${gopath}/src/github.com/300brand/coverageservices",
    provider => git,
    source   => 'git://github.com/300brand/coverageservices.git',
    tag      => 'gocode',
  }

  vcsrepo { 'disgo':
    ensure   => latest,
    notify   => Exec['recompile'],
    path     =>"${gopath}/src/github.com/300brand/disgo",
    provider => git,
    source   => 'git://github.com/300brand/disgo.git',
    tag      => 'gocode',
  }

  vcsrepo { 'logger':
    ensure   => latest,
    notify   => Exec['recompile'],
    path     =>"${gopath}/src/github.com/300brand/logger",
    provider => git,
    source   => 'git://github.com/300brand/logger.git',
    tag      => 'gocode',
  }

  vcsrepo { 'go-toml-config':
    ensure   => latest,
    notify   => Exec['recompile'],
    path     =>"${gopath}/src/github.com/300brand/go-toml-config",
    provider => git,
    source   => 'git://github.com/300brand/go-toml-config.git',
    tag      => 'gocode',
  }

  vcsrepo { 'statsd':
    ensure   => latest,
    notify   => Exec['recompile'],
    path     =>"${gopath}/src/github.com/300brand/statsd",
    provider => git,
    source   => 'git://github.com/300brand/statsd.git',
    tag      => 'gocode',
  }

  # Establish dependency where all repos must update before recompiling
  Vcsrepo <| tag == 'gocode' |> -> Exec['recompile']

  $service_pkg = 'github.com/300brand/coverageservices'
  exec { 'recompile':
    command     => "GOPATH=${gopath} /usr/bin/go install ${service_pkg}",
    notify      => Service['coverageservices'],
    refreshonly => true,
  }


  service { 'coverageservices':
    ensure  => running,
    require => File['/etc/init.d/coverageservices'],
  }
}
