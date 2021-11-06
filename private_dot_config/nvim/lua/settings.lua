vim.opt.autoread = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.syntax = 'on'
vim.opt.confirm = true
vim.opt.mouse = 'a'
vim.opt.breakindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.syntax = 'on'
vim.opt.splitbelow = true -- force all horizontal splits to go below current window.
vim.opt.splitright = true -- force all vertical splits to go to the right of current window.
vim.opt.updatetime = 300 -- faster completion.
vim.opt.cursorline = true -- highlight the current line.
vim.opt.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time.
vim.opt.scrolloff = 8 -- Lines to keep above and below cursor.
vim.opt.sidescrolloff = 8

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
