node /^\w+\.node\.\w+\.coverage\.net/ {
  include coverage::golang
  include coverage::service
  include coverage::mongo::shell
}
