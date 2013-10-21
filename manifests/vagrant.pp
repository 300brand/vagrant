package { 'etckeeper':
	ensure => installed,
}

package { 'ntpdate':
	ensure => installed,
}

network::interface{ 'eth1':
	address   => $eth1_ip,
	broadcast => $eth1_broadcast,
	network   => $eth1_network,
}

node 'glenscotia.dns.campbeltown.coverage.net' {
	include coveragedns
}

node 'kilkerran.puppetmaster.campbeltown.coverage.net' {
	package { 'puppetmaster':
		ensure => installed,
	}
}
