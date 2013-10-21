class coverage_puppet {
	package { 'puppet':
		ensure => installed,
	}

	file { 'puppet.conf':
		path    => '/etc/puppet/puppet.conf',
		ensure  => file,
		require => Package['puppet'],
		content => template("coverage_puppet/puppet.conf.erb"),
	}

	file { 'puppet_initd':
		path    => '/etc/default/puppet',
		ensure  => file,
		require => Package['puppet'],
		content => "puppet:///modules/coverage_puppet/puppet_initd",
	}

	service { 'puppet':
		ensure => running,
	}
}
