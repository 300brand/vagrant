# +--------------+
# | HIGHLAND     |
# | glenmorangie | --[rs0]
# | thedalmore   | ----|----+
# | dalwhinnie   | ----|----|--[rs2]
# | themacallan  | ----|----|----|----+
# +--------------+     |    |    |    |
# | ISLAND       |     |    |    |    |
# | ledaig       | ----+    |    |    |
# | highlandpark | -------[rs1]  |    |
# | isleofjura   | --------------+    |
# | tobermory    | -----------------[rs3]
# +--------------+

node 'glenmorangie.mongo.highland.coverage.net', 'ledaig.mongo.island.coverage.net' {
  class { 'coverage::mongo::data':
    replSet => 'rs0',
  }

  limits::limits {
    'mongodb_nofile':
      ensure     => present,
      user       => 'mongodb',
      limit_type => 'nofile',
      both       => 64000,
      notify     => Service['mongodb'];
    'mongodb_nproc':
      ensure     => present,
      user       => 'mongodb',
      limit_type => 'nproc',
      both       => 32000,
      notify     => Service['mongodb'];
  }
}

node 'thedalmore.mongo.highland.coverage.net', 'highlandpark.mongo.island.coverage.net' {
  class { 'coverage::mongo::data':
    replSet => 'rs1',
  }

  limits::limits {
    'mongodb_nofile':
      ensure     => present,
      user       => 'mongodb',
      limit_type => 'nofile',
      both       => 64000,
      notify     => Service['mongodb'];
    'mongodb_nproc':
      ensure     => present,
      user       => 'mongodb',
      limit_type => 'nproc',
      both       => 32000,
      notify     => Service['mongodb'];
  }
}

node 'dalwhinnie.mongo.highland.coverage.net', 'isleofjura.mongo.island.coverage.net' {
  class { 'coverage::mongo::data':
    replSet => 'rs2',
  }

  limits::limits {
    'mongodb_nofile':
      ensure     => present,
      user       => 'mongodb',
      limit_type => 'nofile',
      both       => 64000,
      notify     => Service['mongodb'];
    'mongodb_nproc':
      ensure     => present,
      user       => 'mongodb',
      limit_type => 'nproc',
      both       => 32000,
      notify     => Service['mongodb'];
  }
}

node 'themacallan.mongo.highland.coverage.net', 'tobermory.mongo.island.coverage.net' {
  class { 'coverage::mongo::data':
    replSet => 'rs3',
  }

  limits::limits {
    'mongodb_nofile':
      ensure     => present,
      user       => 'mongodb',
      limit_type => 'nofile',
      both       => 64000,
      notify     => Service['mongodb'];
    'mongodb_nproc':
      ensure     => present,
      user       => 'mongodb',
      limit_type => 'nproc',
      both       => 32000,
      notify     => Service['mongodb'];
  }
}

