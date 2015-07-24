print("loading start.lua...")
package.path = package.path .. ";lib\\?.lua"
-- warning when define global variable
dofile("lib/disable_global.lua")
-- open class (like table.tostring)
dofile("lib/util.lua")
require 'lib.logger'
require 'lib.config'
require 'lib.device'
require 'lib.node_http'
logger.info("logger loaded")
logger.info("env: %s", config.env)
logger.info("mode: %s", device.mode)


-- main routine
if device.mode == "normal" then
  dofile("./process_normal.lua")
elseif device.mode == "setting" then
  dofile("./process_setting.lua")
else
  logger.error("unknown device mode: ", device.mode)
end
