node 'glenscotia.dns.campbeltown.coverage.net' {
  class { 'coverage::dns':
    before => Stage['main']
  }
}
