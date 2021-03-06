# Class: coverage::service
#
# Maintains the coverage service at the latest version
#
class coverage::service (
  ){

  package {
    'libxml2-dev':
      ensure => installed;
    'pkg-config':
      ensure => installed;
    'libsqlite3-dev':
      ensure => installed;
    'supervisor':
      ensure => installed;
  }

  file {
    '/home/vagrant/go':
      ensure => directory,
      mode   => '0755',
      owner  => 'vagrant',
      group  => 'vagrant',
      notify => File['/etc/profile.d/gopath.sh'];
    '/etc/profile.d/gopath.sh':
      ensure  => file,
      content => template('coverage/gopath.sh.erb'),
      mode    => '0644';
    '/etc/coverage.toml':
      ensure  => file,
      content => template('coverage/coverage.toml.erb'),
      mode    => '0644';
    '/etc/supervisor/conf.d/inet_http_server.conf':
      ensure  => file,
      content => template('coverage/supervisor_http.conf.erb'),
      mode    => '0644',
      require => Package['supervisor'];
    '/etc/supervisor/conf.d/coverageservices.conf':
      ensure  => file,
      content => template('coverage/supervisor_coverage.conf.erb'),
      mode    => '0644',
      require => Package['supervisor'];
    # '/etc/init.d/coverageservices':
    #   ensure  => file,
    #   content => template('coverage/coverage_initd.erb'),
    #   mode    => '0755';
  }

  # exec { 'install_initd':
  #   command   => '/usr/sbin/update-rc.d coverageservices defaults',
  #   subscribe => File['/etc/init.d/coverageservices'],
  # }

  # vcsrepo { 'coverage':
  #   ensure   => latest,
  #   notify   => Exec['recompile'],
  #   path     =>"${gopath}/src/github.com/300brand/coverage",
  #   provider => git,
  #   revision => 'master',
  #   source   => 'git://github.com/300brand/coverage.git',
  #   tag      => 'gocode',
  # }

  # vcsrepo { 'coverageservices':
  #   ensure   => latest,
  #   notify   => Exec['recompile'],
  #   path     =>"${gopath}/src/github.com/300brand/coverageservices",
  #   provider => git,
  #   revision => 'master',
  #   source   => 'git://github.com/300brand/coverageservices.git',
  #   tag      => 'gocode',
  # }

  # vcsrepo { 'disgo':
  #   ensure   => latest,
  #   notify   => Exec['recompile'],
  #   path     =>"${gopath}/src/github.com/300brand/disgo",
  #   provider => git,
  #   revision => 'master',
  #   source   => 'git://github.com/300brand/disgo.git',
  #   tag      => 'gocode',
  # }

  # vcsrepo { 'logger':
  #   ensure   => latest,
  #   notify   => Exec['recompile'],
  #   path     =>"${gopath}/src/github.com/300brand/logger",
  #   provider => git,
  #   revision => 'master',
  #   source   => 'git://github.com/300brand/logger.git',
  #   tag      => 'gocode',
  # }

  # vcsrepo { 'go-toml-config':
  #   ensure   => latest,
  #   notify   => Exec['recompile'],
  #   path     =>"${gopath}/src/github.com/300brand/go-toml-config",
  #   provider => git,
  #   revision => 'master',
  #   source   => 'git://github.com/300brand/go-toml-config.git',
  #   tag      => 'gocode',
  # }

  # vcsrepo { 'statsd':
  #   ensure   => latest,
  #   notify   => Exec['recompile'],
  #   path     =>"${gopath}/src/github.com/300brand/statsd",
  #   provider => git,
  #   revision => 'master',
  #   source   => 'git://github.com/300brand/statsd.git',
  #   tag      => 'gocode',
  # }

  # vcsrepo { 'gokogiri':
  #   ensure   => latest,
  #   notify   => Exec['recompile'],
  #   path     =>"${gopath}/src/github.com/moovweb/gokogiri",
  #   provider => git,
  #   revision => 'master',
  #   source   => 'git://github.com/moovweb/gokogiri.git',
  #   tag      => 'gocode',
  # }

  # # Establish dependency where all repos must update before recompiling
  # Vcsrepo <| tag == 'gocode' |> -> Exec['recompile']



  # $service_pkg = 'github.com/300brand/coverageservices'
  # exec { 'recompile':
  #   command     => "/usr/bin/go get ${service_pkg}",
  #   environment => ["GOPATH=${gopath}"],
  #   notify      => Service['coverageservices'],
  #   path        => ['/usr/bin'],
  #   refreshonly => true,
  #   require     => [
  #     Package['libxml2-dev'],
  #     Package['pkg-config'],
  #   ],
  # }


  # service { 'coverageservices':
  #   ensure  => stopped,
  #   require => [
  #     File['/etc/init.d/coverageservices'],
  #     Exec['recompile'],
  #   ],
  # }
}
