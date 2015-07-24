print("loading start.lc...")
package.path = package.path .. ";lib\\?.lc"
-- warning when define global variable
dofile("lib/disable_global.lc")
-- open class (like table.tostring)
dofile("lib/util.lc")
require 'lib.logger'
require 'lib.config'
require 'lib.device'
require 'lib.node_http'
logger.info("logger loaded")
logger.info("env: %s", config.env)
logger.info("mode: %s", device.mode)


-- main routine
if device.mode == "normal" then
  dofile("./process_normal.lc")
elseif device.mode == "setting" then
  dofile("./process_setting.lc")
else
  logger.error("unknown device mode: ", device.mode)
end
