return function (connection, args)
   logger.info("start to respond connect.lua")
   connection:send("HTTP/1.0 200 OK\r\nContent-Type: text/html\r\nCache-Control: private, no-store\r\n\r\n")
   connection:send('<!DOCTYPE html><html lang="en"><head><meta charset="utf-8"><title>Save config</title></head>')
   connection:send('<body>')
   local ssid = args.ssid
   local pass = args.pass
   logger.info("ssid: %s", ssid)
   logger.info("pass: %s", pass)
   coroutine.yield()
   logger.info("start to save file..")
   file.open("ap_config.lua","w+")
   local conf_format = 'return {ssid="%s", pass="%s"}'
   local conf_str = string.format(conf_format, ssid, pass)
   file.writeline(conf_str)
   file.close()
   logger.info("save completed")
   connection:send('<h1>Your configuration saved successfully.</h1>')
   connection:send('</body></html>')
   logger.info("respond 200 OK.")
   node.restart()
end
