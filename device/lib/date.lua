module("date", package.seeall)
require 'lib/config'
function now()
  if config.env == "prd" then
    return tmr.now()
  else
    return os.date("%Y-%m-%d %H:%M:%S")
  end
end
