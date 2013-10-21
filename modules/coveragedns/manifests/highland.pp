class coveragedns::highland {
	dns::record::a {
		'highland':
			zone => "coverage.net",
			data => ["192.168.20.18"];
		'glenmorangie.mongo.highland':
			zone => "coverage.net",
			data => ["192.168.20.40"];
		'themacallan.mongo.highland':
			zone => "coverage.net",
			data => ["192.168.20.41"];
		'oldpulteney.mongocfg.highland':
			zone => "coverage.net",
			data => ["192.168.20.39"];
	}
}
