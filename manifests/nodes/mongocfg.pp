node /^\w+\.mongocfg\.\w+\.coverage\.net/ {
  include coverage::mongo::config
  include coverage::mongo::shell
}
