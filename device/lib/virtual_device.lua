wifi = {}
wifi.setmode = function(num)
  logger.info("call wifi.setmode")
end
wifi.ap = {}
wifi.ap.config = function(t)
  logger.info("call wifi.ap.config")
end
wifi.sta = {}
wifi.sta.config = function(a, b)
  logger.info("call wifi.sta.config")
end
wifi.sta.connect = function()
  logger.info("call wifi.sta.connect")
end

node = {}
node.chipid = function()
  return 1234
end

node.flashid = function()
  return 5678
end

file = {}
file.open = function(a, b)
  logger.info("call file open")
  return true
end

file.close = function()
  logger.info("call file close")
end
