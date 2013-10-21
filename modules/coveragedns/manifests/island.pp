class coveragedns::island {
	dns::record::a {
		'island':
			zone => "coverage.net",
			data => ["192.168.20.19"];
		'highlandpark.mongo.island':
			zone => "coverage.net",
			data => ["192.168.20.44"];
		'ledaig.mongo.island':
			zone => "coverage.net",
			data => ["192.168.20.43"];
		'talisker.mongocfg.island':
			zone => "coverage.net",
			data => ["192.168.20.42"];
	}
}
