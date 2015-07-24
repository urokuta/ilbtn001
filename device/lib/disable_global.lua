local _KNOWN_GLOBALS = {
  logger = true,
  config = true,
  device = true,
  ansicolors = true,
  node_http = true,
    --外部モジュールはたまにGlobalに変数を定義するので、一旦無視をしたい変数をこちらに追加
}
setmetatable(_G, {
    __index = function( t, k )
        if _KNOWN_GLOBALS[k] then
            return
        end    
        print("ERROR", debug.traceback("access of undefined global "..tostring(k), 2))
        _KNOWN_GLOBALS[k] = true
    end,
    __newindex = function( t, k, v )
        rawset(t, k, v)
        if _KNOWN_GLOBALS[k] then
            return
        end
        print("WARN", debug.traceback("creating new global "..tostring(k).."="..tostring(v), 2))
    end
})
