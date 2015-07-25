print("loading start.lc...")
package.path = package.path .. ";lib\\?.lc"
print("logger loading..")
require 'lib.logger'
print("logger load completed.")
logger.info("start initialize")
-- warning when define global variable
--dofile("lib/disable_global.lc")
--logger.info("global disabled")
-- open class (like table.tostring)
dofile("lib/util.lc")
logger.info("util loaded")
require 'lib.config'
logger.info("lib.config loaded")
require 'lib.device'
logger.info("lib.device loaded")
require 'lib.node_http'
logger.info("lib.node_http loaded")
logger.info("env: %s", config.env)
logger.info("mode: %s", device.mode)
if config.env == "dev" then
  dofile("lib/virtual_device.lc")
end


-- main routine
if device.mode == "normal" then
  wifi.setmode(wifi.STATION)
  dofile("process_normal.lc")
elseif device.mode == "setting" then
  wifi.setmode(wifi.STATIONAP)
  dofile("process_setting.lc")
else
  logger.error("unknown device mode: ", device.mode)
end
