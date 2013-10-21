class coverage_dns::campbeltown {
	dns::record::a{
		'campbeltown':
			zone => "coverage.net",
			data => ["192.168.20.17"];
		'campbeltown.stats.campbeltown':
			zone => "coverage.net",
			data => ["192.168.20.35"];
		'glenscotia.dns.campbeltown':
			zone => "coverage.net",
			data => ["192.168.20.34"];
		'hazelburn.mongocfg.campbeltown':
			zone => "coverage.net",
			data => ["192.168.20.36"];
		'kilkerran.puppetmaster.campbeltown':
			zone => "coverage.net",
			data => ["192.168.20.33"];
		'longrow.mongo.campbeltown':
			zone => "coverage.net",
			data => ["192.168.20.37"];
		'springbank.mongo.campbeltown':
			zone => "coverage.net",
			data => ["192.168.20.38"];
	}
}
