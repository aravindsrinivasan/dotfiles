-- Init.

-- Make sure lazy is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to set `mapleader` before lazy so mappings are correct
vim.g.mapleader = " "

require("lazy").setup('plugins')

-- Vim settings.
require('settings')

-- LSP Config.
require('lsp_config')
-- vim.lsp.set_log_level("debug")

-- Mappings.
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

-- Map Ctrl-c to ESC so the InsertLeave autocommand event is triggered.
map('i', '<C-c>', '<Esc>', opt)

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
map('n', '<Leader>sc', ':OSCYankRegister +<CR>', opt)
map('v', '<Leader>c', ':OSCYankVisual<CR>', opt)

-- Misc Mappings.
map('n', '<C-x><C-b>', ':Buffers<CR>', opt)
map('n', '<C-x><C-f>', ':FZF<CR>', opt)
map('n', '<C-x><C-h>', ':History<CR>', opt)
map('n', '<C-Space>', ':NvimTreeFindFileToggle<CR>', opt)

_G.copy_file_path_to_clipboard = function()
  vim.cmd [[
    let @f = expand('%')
    OSCYankRegister f
  ]]
end
map('n', '<Leader>c', '<cmd>lua copy_file_path_to_clipboard()<CR>', opt)
