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

-- Nvim-tree.
require('nvim_tree')

-- LSP Config.
require('lsp_config')
-- vim.lsp.set_log_level("debug")

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
map('i', '<M-BS>', '<ESC>bcw', opt)

-- Leader Mappings.
map('n', '<Leader><Space>', ':noh<CR>', opt)
map('n', '<Leader>osc', ':OSCYankReg +<CR>', opt)
map('v', '<Leader>c', ':OSCYank<CR>', opt)

-- Misc Mappings.
map('n', '<C-x>b', ':Buffers<CR>', opt)
map('n', '<C-x><C-f>', ':FZF<CR>', opt)
map('n', '<C-x><C-h>', ':History<CR>', opt)

_G.copy_file_path_to_clipboard = function()
  vim.cmd [[
    let @f = expand('%')
    OSCYankReg f
  ]]
end
map('n', '<Leader>c', '<cmd>lua copy_file_path_to_clipboard()<CR>', opt)

