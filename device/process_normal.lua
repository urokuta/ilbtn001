is_exist = file.open("ap_config.lua", "r")
file.close()
if is_exist == nil then
  logger.info("ap_config.lua not found. you need to configure firstly.")
else
  ap_config = dofile("ap_config.lua")
  logger.info("try to connect... ssid: ", ap_config.ssid)
  wifi.sta.config(ap_config.ssid, ap_config.pass)
  wifi.sta.connect()
  logger.info("connected.")

  local path_format = "%sc_%s_f_%s"
  local path = string.format(path_format, config.api_path, node.chipid(), node.flashid())
  node_http.get(config.host, path, function()
    logger.info("completed. will dsleep.")
  end)
end
