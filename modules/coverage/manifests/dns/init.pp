class coverage::dns {
	include dns::server
	include coverage::dns::campbeltown
	include coverage::dns::highland
	include coverage::dns::island

	dns::zone { 'coverage.net':
		soa         => "ns1.coverage.net",
		soa_email   => "admin.coverage.net",
		nameservers => ["ns1"],
	}

	dns::record::a {
		'ns1':
			zone => "coverage.net",
			data => ["127.0.0.1"];
	}
}
