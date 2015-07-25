local function render_html(connection, args, wifi_aps)
   logger.info("start to respond")
   connection:send("HTTP/1.0 200 OK\r\nContent-Type: text/html\r\nCache-Control: private, no-store\r\n\r\n")
   connection:send('<!DOCTYPE html><html lang="en"><head><meta charset="utf-8"><title>List access points around you</title></head>')
   connection:send('<body>')
   coroutine.yield()
   connection:send('<h1>List access points around you</h1>')
   for ssid, v in pairs(wifi_aps) do
     logger.info("ssid: %s", ssid)
     connection:send('<p>SSID: ')
     connection:send(ssid)
     connection:send('</p>')
     coroutine.yield()
   end
   connection:send('</body></html>')
end

local function with_wifi_aps(connection, args)
  wifi.sta.getap(function(t) render_html(connection, args, t) end)
end

return function (connection, args)
  collectgarbage()
  with_wifi_aps(connection, args)
end
