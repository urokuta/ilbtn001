module("logger", package.seeall)
require 'lib.ansicolors'

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
  local t = os.date("%Y-%m-%d %H:%M:%S")
  -- color1[Time][Level]color1end color2[LogContent]color2end
  local f = "%s[%s][%s]%s %s%s%s"
  local left_color = ansicolors.magenta
  local result = string.format(f, left_color, t, level, ansicolors.reset, color, str, ansicolors.reset)
  return result
end

function info(...)
  local s = to_s("INFO", ansicolors.reset, ...)
  print(s)
end
function error(...)
  local s = to_s("ERROR", ansicolors.red, ...)
  print(s)
end

