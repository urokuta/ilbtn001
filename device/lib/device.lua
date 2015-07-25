module("device", package.seeall)
require "lib.config"
function read_gpio()
  if config.env == "prd" then
    return gpio.read(2)
  else
    return config.dev.gpio
  end
end

function is_setting_button_pushed()
  return read_gpio() == 0
end

device.mode = device.is_setting_button_pushed() and "setting" or "normal"

