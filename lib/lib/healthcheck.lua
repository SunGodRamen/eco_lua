function healthCheck()
  local command = "df -h /"
  local output = hs.execute(command)
  local availableSpace = tonumber(string.match(output, "%d+")) or 0
  if availableSpace < 10 then
      hs.alert.show("Warning: Low Disk Space")
  end
end
