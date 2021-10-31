-- Init.

-- Make sure packer is installed
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Vim settings.
require('settings')

-- Packer.
require('plugins')

-- LSP Config.
require('lsp_config')
vim.lsp.set_log_level("debug")

-- Mappings.
vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

-- Split Screen Mappings.
map('n', '<C-h>', '<C-w>h', opt)
map('n', '<C-l>', '<C-w>l', opt)
map('n', '<C-j>', '<C-w>j', opt)
map('n', '<C-k>', '<C-w>k', opt)

-- Cursor Mappings.
map('n', '<C-a>', '^', opt)
map('n', '<C-e>', '$', opt)
map('i', '<C-a>', '<ESC>I', opt)
map('i', '<C-e>', '<ESC>A', opt)
map('i', '<M-f>', '<ESC><Space>Wi', opt) 
map('i', '<M-b>', '<ESC>Bi', opt)

-- Leader Mappings.
map('n', '<Leader><Space>', ':noh<CR>', opt)

-- Misc Mappings.
map('n', '<C-x>b', ':ls<CR>:b<Space>', opt)
map('n', '<C-x><C-f>', ':FZF<CR>', opt)

require('nvim_tree')

-- Treesitter Config.
local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}

