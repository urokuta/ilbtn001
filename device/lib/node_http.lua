module("node_http", package.seeall)
require 'lib.config'

function get(host, path, callback)
  logger.info("request to host: %s", host)
  logger.info("path: %s", path)
  if config.env == "prd" then
    _get_prd(host, path, callback)
  else
    _get_dev(host, path, callback)
  end
end

function _get_prd(host, path, callback)
  logger.info("resolve host..")
  getip(host, function(conn, ip)
    print(ip)
    logger.info("ip resolved. ip: %s", ip)
    logger.info("creating connection..")
    conn:on("receive", function()
      callback()
    end)
    conn:connect(80, ip)
    logger.info("connected.")
    logger.info("request path: %s", path)
    conn:send("GET " .. path .. " HTTP/1.1\r\nHost: " .. host .. "\r\nConnection: keep-alive\r\nAccept: */*\r\n\r\n")
  end)
end

function getip(host, callback)
  local conn = net.createConnection(net.TCP, 0)
  conn:dns(host, function(_conn,ip) callback(_conn, ip) end)
  conn = nil
end

function _get_dev(host, path, callback)
  local http = require 'socket.http'
  url = "http://" .. host .. path
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
