# ==Class: coverage::collectd
#
# Installs collectd
#
class coverage::collectd {
  class { 'collectd':
    purge        => true,
    recurse      => true,
    purge_config => true,
  }

  class { 'collectd::plugin::df':
    mountpoints    => [
      '/dev',
      '/vagrant',
      '/tmp/vagrant-puppet/manifests',
      '/tmp/vagrant-puppet/modules-0',
    ],
    fstypes        => ['tmpfs', 'none', 'udev', 'proc'],
    ignoreselected => true,
  }

  class { 'collectd::plugin::disk':
  }

  class { 'collectd::plugin::interface':
    interfaces     => ['lo'],
    ignoreselected => true,
  }

  class { 'collectd::plugin::syslog':
    log_level => 'warning',
  }

  class { 'collectd::plugin::write_graphite':
    graphitehost => 'campbeltown.stats.campbeltown.coverage.net',
  }

  file { "${collectd::params::plugin_conf_dir}/memory.conf":
    ensure  => 'present',
    path    => "${collectd::params::plugin_conf_dir}/memory.conf",
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => "LoadPlugin memory\n",
    notify  => Service['collectd']
  }

  file { "${collectd::params::plugin_conf_dir}/cpu.conf":
    ensure  => 'present',
    path    => "${collectd::params::plugin_conf_dir}/cpu.conf",
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => "LoadPlugin cpu\n",
    notify  => Service['collectd']
  }
}
