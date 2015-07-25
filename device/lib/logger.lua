module("logger", package.seeall)
require 'lib.ansicolors'
require 'lib.date'

function to_s(level, color, ...)
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
  -- color1[Time][Level]color1end color2[LogContent]color2end
  local f = "%s[%s][%s]%s %s%s%s"
  -- ansicolors.XXX is table, not string
  local left_color = ansicolors.magenta["value"]
  local result = string.format(f, left_color, t, level, ansicolors.reset["value"], color, str, ansicolors.reset["value"])
  return result
end

function info(...)
  local s = to_s("INFO", ansicolors.reset["value"], ...)
  print(s)
end
function error(...)
  local s = to_s("ERROR", ansicolors.red["value"], ...)
  print(s)
end

