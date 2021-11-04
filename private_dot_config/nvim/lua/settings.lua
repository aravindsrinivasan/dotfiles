-- Global
local o = vim.o
o.autoread = true
o.ignorecase = true
o.smartcase = true
o.termguicolors = true
o.syntax = 'on'
o.confirm = true
o.mouse = 'a'
o.breakindent = true

-- Window
local wo = vim.wo
wo.number = true
wo.relativenumber = true
wo.signcolumn = 'yes'

-- Buffer
local bo = vim.bo
bo.tabstop = 2
bo.expandtab = true
bo.shiftwidth = 2
bo.softtabstop = 2
bo.autoindent = true
bo.smartindent = true
bo.syntax = 'on'

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)
