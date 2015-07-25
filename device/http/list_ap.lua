local function render_html(connection, args, wifi_aps)
   logger.info("start to respond list_ap.lua")
   connection:send("HTTP/1.0 200 OK\r\nContent-Type: text/html\r\nCache-Control: private, no-store\r\n\r\n")
   connection:send('<!DOCTYPE html><html lang="en"><head><meta charset="utf-8"><title>List access points around you</title></head>')
   connection:send('<body>')
   logger.info("connection yield")
   coroutine.yield()
   connection:send('<h1>List access points around you</h1>')
   logger.info("h1 output")
   for ssid, v in pairs(wifi_aps) do
     logger.info("ssid: %s", ssid)
     connection:send('<div>')
       connection:send('<p>SSID: ')
       connection:send(ssid)
       connection:send('</p>')
       connection:send('<form method="GET" action="/connect.lua">')
         connection:send('<input type="hidden" name="ssid" value="' .. ssid .. '" />')
         connection:send('<input type="text" name="pass"/>')
         connection:send('<input type="submit" value="Connect!"/>')
       connection:send('</form>')
     connection:send('</div>')
     coroutine.yield()
   end
   connection:send('</body></html>')
   logger.info("respond 200 OK.")
end

local function with_wifi_aps(connection, args)
  wifi.sta.getap(function(t) render_html(connection, args, t) end)
end

return function (connection, args)
  with_wifi_aps(connection, args)
end
