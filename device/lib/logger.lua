module("logger", package.seeall)
require 'lib.date'

function to_s(level, ...)
  local args = {...}
  -- first argument is format string.
  local str = args[1]
  table.remove(args, 1)
  -- replace %s to string variable
  for k, v in pairs(args) do
    local to_str = v
    if type(v) == "table" then
      to_str = table.tostring(v)
    end
    str = string.format(str, to_str)
  end
  local t = date.now()
  -- [Time][Level] [LogContent]
  local f = "[%s][%s] %s"
  local result = string.format(f, t, level, str)
  return result
end

function info(...)
  local s = to_s("INFO", ...)
  print(s)
end
function error(...)
  local s = to_s("ERROR", ...)
  print(s)
end

