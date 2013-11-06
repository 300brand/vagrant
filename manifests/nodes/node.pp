node /^\w+\.node\.\w+\.coverage\.net/ {
  include coverage::golang
  include coverage::service
  include coverage::mongo::shell

  limits::limits {
    'all_nofile':
      ensure     => present,
      user       => '*',
      limit_type => 'nofile',
      hard       => 64000,
      soft       => 4096,
      notify     => Service['mongodb'];
    'all_nproc':
      ensure     => present,
      user       => '*',
      limit_type => 'nproc',
      hard       => 32000,
      soft       => 2048,
      notify     => Service['mongodb'];
  }
}
