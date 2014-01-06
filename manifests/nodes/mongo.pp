# +--------------+
# | HIGHLAND     |
# | glenmorangie | --[rs0]
# | thedalmore   | ----|----+
# | dalwhinnie   | ----|----|--[rs2]
# | themacallan  | ----|----|----|----+
# +--------------+     |    |    |    |
# | ISLAND       |     |    |    |    |
# | ledaig       | ----+    |    |    |
# | highlandpark | ----|--[rs1]  |    |
# | isleofjura   | ----|----|----+    |
# | tobermory    | ----|----|----|--[rs3]
# +--------------+     |    |    |    |
# | LOWLAND      |     |    |    |    |
# | annandale    | ----+    |    |    |
# | auchentoshan | ---------+----|    |
# | bladnoch     | --------------+    |
# | inverleven   | -------------------+
# +--------------+

node 'glenmorangie.mongo.highland.coverage.net', 'ledaig.mongo.island.coverage.net', 'annandale.mongo.lowland.coverage.net' {
  class { 'coverage::mongo::data':
    replSet => 'rs0',
  }
}
node 'thedalmore.mongo.highland.coverage.net', 'highlandpark.mongo.island.coverage.net', 'auchentoshan.mongo.lowland.coverage.net' {
  class { 'coverage::mongo::data':
    replSet => 'rs1',
  }
}
node 'dalwhinnie.mongo.highland.coverage.net', 'isleofjura.mongo.island.coverage.net', 'bladnoch.mongo.lowland.coverage.net' {
  class { 'coverage::mongo::data':
    replSet => 'rs2',
  }
}
node 'themacallan.mongo.highland.coverage.net', 'tobermory.mongo.island.coverage.net', 'inverleven.mongo.lowland.coverage.net' {
  class { 'coverage::mongo::data':
    replSet => 'rs3',
  }
}
