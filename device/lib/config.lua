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
