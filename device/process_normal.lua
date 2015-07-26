is_exist = file.open("ap_config.lua", "r")
file.close()
if is_exist == nil then
  logger.info("ap_config.lua not found. you need to configure firstly.")
else
  local ap_config = dofile("ap_config.lua")
  logger.info("try to connect... ssid: %s", ap_config.ssid)
  wifi.sta.config(ap_config.ssid, ap_config.pass)
  wifi.sta.connect()
  logger.info("waiting connection establishment.")
  local connect_status = nil
  local counter = 0
  tmr.alarm(1, 1000, 1,
    function()
      connect_status = wifi.sta.status()
      logger.info("status: %s", connect_status)
      if connect_status == 5 then
        tmr.stop(1)
        local current_ip = wifi.sta.getip()
        logger.info("ip: %s", current_ip)
        if current_ip == nil then
          logger.error("invalid status. ip is nil.")
          logger.error("application will exit and wait operation.")
          return
        end

        local path_format = "%sc_%s_f_%s"
        local path = string.format(path_format, config.api_path, node.chipid(), node.flashid())
        node_http.get(config.host, path, function()
          logger.info("completed. will dsleep.")
          node.dsleep(0)
        end)
      end
    end
  )
end
