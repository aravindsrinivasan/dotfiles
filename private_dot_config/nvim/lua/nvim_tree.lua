local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

-- Mappings.
map('n', '<C-Space>', ':NvimTreeFindFileToggle<CR>', opt)

-- Settings.
vim.g.nvim_tree_ignore = {'.git', 'node_modules', '.cache', '.vscode', 'bazel-bin', 'bazel-Nuro', 'bazel-out', 'bazel-testlogs'}
vim.g.nvim_tree_gitignore = 1

require'nvim-tree'.setup{
  auto_close = true,
}

