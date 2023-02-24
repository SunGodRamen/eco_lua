-- Set the hybrid line numbers
vim.cmd('set number relativenumber')
vim.cmd('highlight CursorLineNr guifg=#fabd2f')
-- Load the custom color scheme
dofile(vim.fn.stdpath('config')..'/colors.lua')
-- Set the default color scheme
vim.cmd('colorscheme corp.ra')

vim.cmd('autocmd FileType task setlocal syntax=task')

-- Install Packer if not already installed
local packer_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
  vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '..packer_path)
end


ra_ = require('lib')

-- Configure Packer
vim.cmd('packadd packer.nvim')
require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}

  -- Add your plugins here
  use {'dbmrq/vim-taskwarrior'}
  use {'tpope/vim-commentary'}
  use {'tpope/vim-surround'}
  use {'jiangmiao/auto-pairs'}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'neovim/nvim-lspconfig'}
  use {'hrsh7th/nvim-compe'}
  use {'folke/trouble.nvim'}
  use {'kyazdani42/nvim-web-devicons'}
  use {'akinsho/nvim-toggleterm.lua'}
  use {'nvim-telescope/telescope.nvim'}
  use {'nvim-lua/popup.nvim'}
  use {'nvim-lua/plenary.nvim'}
  use {'vim-airline/vim-airline'}
  use {'vim-airline/vim-airline-themes'}
  use {'jremmen/vim-ripgrep'}
  use {'windwp/nvim-autopairs'}
  use {'editorconfig/editorconfig-vim'}
  use {'voldikss/vim-floaterm'}
  use {'tweekmonster/startuptime.vim'}
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
  use {'SmiteshP/nvim-gps'}
  use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
  use {'tjdevries/colorbuddy.nvim'}
  use {'p00f/nvim-ts-rainbow'}
  use {'rafcamlet/nvim-luapad'}
  use {'folke/which-key.nvim'}
  use {'nvim-lua/lsp-status.nvim'}
  use {'windwp/nvim-ts-autotag'}
  use {'pwntester/octo.nvim'}
  use {'akinsho/nvim-bufferline.lua'}
  use {'nvim-telescope/telescope-frecency.nvim'}
  use {'oberblastmeister/neuron.nvim'}
  use {'onsails/lspkind-nvim'}

  -- TaskWarrior integration
  use {'dbmrq/vim-taskwarrior'}

  -- Auto-completion
  use {'hrsh7th/nvim-compe'}
  use {'hrsh7th/vim-vsnip'}
  use {'hrsh7th/vim-vsnip-integ'}

  -- Syntax highlighting for Lua
  use {'euclidianAce/BetterLua.vim'}

  -- Add other plugins here
end)

-- Remap double-tapping 'k' to exit insert mode
vim.api.nvim_set_keymap('i', 'k', '<ESC>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'kk', '<ESC>', { noremap = true, silent = true
