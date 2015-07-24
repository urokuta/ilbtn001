module("node_http", package.seeall)
require 'lib.config'

function get(url, callback)
  if config.env == "prd" then
  else
    local http = require 'socket.http'
    local r,c,h = http.request{
      url = "http://www.lua.org/"
    }
    logger.info("code: %s", c)
    if c == 200 then
      callback()
    else
      logger.error("connection failed")
    end
  end
end
