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
# | CAMPBELTOWN  |     |    |    |    |
# | campbeltown  | ----+    |    |    |
# | glenscotia   | ---------+----|    |
# | kilkerran    | --------------+    |
# | longrow      | -------------------+
# +--------------+

node 'glenmorangie.mongo.highland.coverage.net', 'ledaig.mongo.island.coverage.net', 'campbeltown.mongo.campbeltown.coverage.net' {
  class { 'coverage::mongo::data':
    replSet => 'rs0',
  }
}
node 'thedalmore.mongo.highland.coverage.net', 'highlandpark.mongo.island.coverage.net', 'glenscotia.mongo.campbeltown.coverage.net' {
  class { 'coverage::mongo::data':
    replSet => 'rs1',
  }
}
node 'dalwhinnie.mongo.highland.coverage.net', 'isleofjura.mongo.island.coverage.net', 'kilkerran.mongo.campbeltown.coverage.net' {
  class { 'coverage::mongo::data':
    replSet => 'rs2',
  }
}
node 'themacallan.mongo.highland.coverage.net', 'tobermory.mongo.island.coverage.net', 'longrow.mongo.campbeltown.coverage.net' {
  class { 'coverage::mongo::data':
    replSet => 'rs3',
  }
}
