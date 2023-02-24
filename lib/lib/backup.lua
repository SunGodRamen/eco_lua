function backupDotfiles()
  local command = "rsync -avz --delete ~/dotfiles/ user@remote:/path/to/backup/"
  hs.execute(command)
end
