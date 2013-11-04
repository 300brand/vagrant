# ==Class: coverage::stats
#
# Sets up and installs graphite and statsd
#
class coverage::stats {
  class { 'graphite':
    secret_key             => 'coverage.net',
    gr_enable_udp_listener => true,
    gr_storage_schemas     => [
      {
        name       => 'default',
        pattern    => '.*',
        retentions => '10s:6h,1m:7d,10m:2y',
      },
      {
        name       => 'collectd',
        pattern    => '^collectd.*',
        retentions => '10s:6h,1m:7d,10m:5y',
      },
      {
        # Info - https://github.com/etsy/statsd/blob/master/docs/graphite.md
        name       => 'stats',
        pattern    => '^stats.*',
        retentions => '10s:6h,1m:7d,10m:5y',
      },
    ],
  } ->
  class { 'statsd':
    address          => '0.0.0.0',
    backends         => [
      './backends/graphite',
    ],
    config           => {
      'graphite' => {
        'legacyNamespace' => false,
      },
    },
    flushinterval    => 10000, # Flush every 10 seconds
    graphiteserver   => '127.0.0.1',
    percentthreshold => [75, 90, 99],
    listenport       => 8125,
  }
}
