local callback = function()
  logger.info("callbacked")
end
node_http.get("http://stackoverflow.com/", callback)
