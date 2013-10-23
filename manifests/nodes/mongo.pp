# +--------------+
# | CAMPBELTOWN  |
# | longrow      | ----------[rs0]
# | springbank   | ------[rs1] |
# +--------------+         |   |
# | HIGHLAND     |         |   |
# | glenmorangie | --[rs2] |   |
# | themacallan  | ----|---|---+
# +--------------+     |   |
# | ISLAND       |     |   |
# | highlandpark | ----|---+
# | lediag       | ----+
# +--------------+

node 'longrow.mongo.campbeltown.coverage.net' {
  class { 'coverage::mongo::data':
    replSet => 'rs0',
  }



  # file { 'mongodir':
  #   ensure => directory,
  #   group  => mongodb,
  #   mode   => '0755',
  #   owner  => mongodb,
  #   path   => "/vagrant/${::fqdn}/mongocfg",
  #   recurse => true,
  # }

  # class { 'mongodb':
  #   options  => {
  #     replSet => 'rs0',
  #   },
  #   template => 'coverage/mongod.conf.erb',
  # }
}

# node 'springbank.mongo.campbeltown.coverage.net' {
#   class { 'mongodb':
#     template => 'coverage/mongod.conf.erb',
#     options  => {
#       replSet => 'rs1',
#     }
#   }
# }

# node 'glenmorangie.mongo.highland.coverage.net' {
#   class { 'mongodb':
#     template => 'coverage/mongod.conf.erb',
#     options  => {
#       replSet => 'rs2',
#     }
#   }
# }

# node 'themacallan.mongo.highland.coverage.net' {
#   class { 'mongodb':
#     template => 'coverage/mongod.conf.erb',
#     options  => {
#       replSet => 'rs0',
#     }
#   }
# }

# node 'highlandpark.mongo.island.coverage.net' {
#   class { 'mongodb':
#     template => 'coverage/mongod.conf.erb',
#     options  => {
#       replSet => 'rs1',
#     }
#   }
# }

# node 'ledaig.mongo.island.coverage.net' {
#   class { 'mongodb':
#     template => 'coverage/mongod.conf.erb',
#     options  => {
#       replSet => 'rs2',
#     }
#   }
# }
