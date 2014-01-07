node 'islay.coverage.net' {
  include coverage::dns
}

node 'lowland.coverage.net' {
  include coverage::dns
  include coverage::stats
}
