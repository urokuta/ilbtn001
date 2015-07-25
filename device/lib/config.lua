module("config", package.seeall)
if os == nil then
  config.is_pc = false
else
  config.is_pc = true
end
-- somehow this way not wroking.
--config.is_pc = os ~= nil
config.env = config.is_pc and "dev" or "prd"
-- gpio socket 2 is usually 1.
-- when you push the button, it will be 0.
config.dev = {}
config.dev.gpio = 1
config.host = "ilbtn.herokuapp.com"
config.api_path = "/serial/"
config.ap = {}
config.ap.ssid = "ilbtn001"
config.ap.pwd = "12345678"
