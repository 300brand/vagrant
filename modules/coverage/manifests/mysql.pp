# == Class: coverage::dns
#
# DNS definitions for the coverage.net domain
#
class coverage::mysql {
  class { '::mysql::server':
    override_options => {
      'mysqld' => {
        'bind-address' => '0.0.0.0',
      }
    },
    users => {
      'spider@%' => {
        ensure                   => 'present',
        max_connections_per_hour => '0',
        max_queries_per_hour     => '0',
        max_updates_per_hour     => '0',
        max_user_connections     => '0',
        password_hash            => '*5C2901F96BBBA397912EF7416EF4BC9B3B2B7672',
      },
      'admin@%' => {
        ensure                   => 'present',
        max_connections_per_hour => '0',
        max_queries_per_hour     => '0',
        max_updates_per_hour     => '0',
        max_user_connections     => '0',
        password_hash            => '*95211EBE089EAED2B3C998E7F0DA9DA4F3E21627',
      },
    },
    grants => {
      'spider@%/spider.*' => {
        ensure     => 'present',
        options    => ['GRANT'],
        privileges => ['SELECT', 'INSERT', 'UPDATE', 'DELETE'],
        table      => 'somedb.*',
        user       => 'spider@%',
      },
      'admin@%/*' => {
        ensure     => 'present',
        options    => ['GRANT'],
        privileges => ['SELECT', 'INSERT', 'UPDATE', 'DELETE'],
        table      => '*.*',
        user       => 'admin@%',
      },
    },
    databases => {
      'spider' => {
        ensure  => 'present',
        charset => 'utf8',
      },
    }
  }
}
