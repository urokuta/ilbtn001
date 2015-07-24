module("config", package.seeall)
config.is_pc = os ~= nil
config.env = config.is_pc and "dev" or "prd"
-- gpio socket 2 is usually 1.
-- when you push the button, it will be 0.
config.gpio = 1
