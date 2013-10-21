class coverage::puppet {
	package { 'puppet':
		ensure => installed,
	}

	file { 'puppet.conf':
		path    => '/etc/puppet/puppet.conf',
		ensure  => file,
		require => Package['puppet'],
		content => template("coverage/puppet.conf.erb"),
	}

	file { 'puppet_initd':
		path    => '/etc/default/puppet',
		ensure  => file,
		require => Package['puppet'],
		content => "puppet:///modules/coverage/puppet_initd",
	}

	service { 'puppet':
		ensure => running,
	}
}
