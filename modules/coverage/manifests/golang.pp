# == Class: coverage::golang
#
# Installs golang The Debian Way
#
class coverage::golang {
  package {
    'bzr':
      ensure => present;
    'git':
      ensure => present;
    'mercurial':
      ensure => present;
    'golang-go':
      ensure => absent;
    'golang-src':
      ensure => absent;
  }

  exec {
    'install_old_go':
      command     => '/usr/bin/apt-get install -y golang-go golang-src',
      creates     => '/usr/bin/go',
      environment => ['DEBIAN_FRONTEND=noninteractive'],
      notify      => Exec['godeb'];
    'godeb':
      command     => '/usr/bin/go get launchpad.net/godeb',
      environment => ['GOPATH=/usr/share/go'],
      creates     => '/usr/lib/go/bin/godeb',
      notify      => [
        Exec['install_go'],
        Package['golang-go'],
        Package['golang-src'],
      ];
    'install_go':
      command => '/usr/lib/go/bin/godeb install 1.1.2',
      creates => '/usr/bin/go';
  }
}
