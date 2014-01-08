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
    'go':
      ensure => absent;
    'golang-go':
      ensure => present;
  }
}
