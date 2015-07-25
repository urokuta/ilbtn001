module("node_http", package.seeall)
require 'lib.config'

function get(url, callback)
  logger.info("request to %s ...", url)
  if config.env == "prd" then
    _get_prd(url, callback)
  else
    _get_dev(url, callback)
  end
end

function _get_prd(url, callback)
end

function _get_dev(url, callback)
  local http = require 'socket.http'
  local r,c,h = http.request{
    url = url
  }
  logger.info("code: %s", c)
  if c == 200 then
    callback()
  else
    logger.error("connection failed")
  end
end
