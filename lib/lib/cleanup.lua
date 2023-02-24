function cleanupFiles(directory, days)
  local command = "find " .. directory .. " -type f -mtime +" .. days .. " -delete"
  hs.execute(command)
end
