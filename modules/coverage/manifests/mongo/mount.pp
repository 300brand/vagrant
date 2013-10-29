# == Class: coverage:mongo:mount
#
# Formats the data drive and mounts it to the mongo storage path
#
class coverage::mongo::mount {
  $dir = '/var/lib/mongodb'

  exec {
    'format_mongo_storage':
      command => '/sbin/mkfs.ext4 -F -L "MONGO" /dev/sdb',
      creates => '/dev/disk/by-label/MONGO';
    'mount_mongo_storage':
      command => "/bin/mount /dev/sdb $dir",
      require => Exec['format_mongo_storage'],
      notify  => File[$dir],
      unless  => "/bin/mountpoint -q $dir";
  }

  file { $dir:
    ensure  => directory,
    group   => mongodb,
    owner   => mongodb,
    require => Class['mongodb'],
  }

  fstab { 'mongo_storage':
    ensure  => present,
    dest    => $dir,
    opts    => 'defaults',
    require => [
      Exec['format_mongo_storage'],
      Exec['mount_mongo_storage'],
    ],
    source  => 'LABEL=MONGO',
    type    => 'ext4',
  }
}
