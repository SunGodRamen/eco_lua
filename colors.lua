-- Define the color palette
local colors = {
  armygreen = '#4b5320',
  goldenrod = '#daa520',
  fireengine = '#ce2029',
  neongreen = '#39ff14',
  neonpurple = '#b400ff',
  skyblue = '#87ceeb'
}

-- Set the color scheme
vim.cmd('highlight Normal guibg='..colors.armygreen..' guifg=#e0e2e4')
vim.cmd('highlight Comment guifg='..colors.goldenrod)
vim.cmd('highlight String guifg='..colors.neongreen)
vim.cmd('highlight Number guifg='..colors.neonpurple)
vim.cmd('highlight Boolean guifg='..colors.skyblue)
vim.cmd('highlight Function guifg='..colors.goldenrod)
vim.cmd('highlight Keyword guifg='..colors.fireengine)
