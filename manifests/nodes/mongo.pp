# +--------------+
# | HIGHLAND     |
# | glenmorangie | --[rs0]
# | thedalmore   | ----+--[rs1]
# | dalwhinnie   | ----+----+--[rs2]
# | themacallan  | ----+----+----+--[rs3]
# +--------------+     |    |    |    |
# | ISLAND       |     |    |    |    |
# | ledaig       | ----+    |    |    |
# | highlandpark | ---------+    |    |
# | isleofjura   | --------------+    |
# | tobermory    | -------------------+
# +--------------+

node 'glenmorangie.mongo.highland.coverage.net', 'ledaig.mongo.island.coverage.net' {
  class { 'coverage::mongo::data':
    replSet => 'rs0',
  }
}
node 'thedalmore.mongo.highland.coverage.net', 'highlandpark.mongo.island.coverage.net' {
  class { 'coverage::mongo::data':
    replSet => 'rs1',
  }
}
node 'dalwhinnie.mongo.highland.coverage.net', 'isleofjura.mongo.island.coverage.net' {
  class { 'coverage::mongo::data':
    replSet => 'rs2',
  }
}
node 'themacallan.mongo.highland.coverage.net', 'tobermory.mongo.island.coverage.net' {
  class { 'coverage::mongo::data':
    replSet => 'rs3',
  }
}
