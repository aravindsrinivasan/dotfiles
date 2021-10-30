local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

-- Mappings.
map('n', '<C-Space>', ':NvimTreeFindFileToggle<CR>', opt)

-- Settings.
vim.g.nvim_tree_ignore = {'.git', 'node_modules', '.cache', '.vscode', 'bazel-bin', 'bazel-Nuro', 'bazel-out', 'bazel-testlogs'}
local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}
