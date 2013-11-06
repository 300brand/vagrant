node /^\w+\.node\.\w+\.coverage\.net/ {
  include coverage::golang
  include coverage::service
  include coverage::mongo::shell

  limits::limits {
    'mongodb_nofile':
      ensure     => present,
      user       => 'mongodb',
      limit_type => 'nofile',
      both       => 64000,
      notify     => Service['mongodb'];
    'mongodb_nproc':
      ensure     => present,
      user       => 'mongodb',
      limit_type => 'nproc',
      both       => 32000,
      notify     => Service['mongodb'];
  }
}
