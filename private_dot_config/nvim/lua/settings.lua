-- Global
local o = vim.o
o.autoread = true
o.smartcase = true
o.ignorecase = true
o.termguicolors = true
o.syntax = 'on'
o.confirm = true

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

