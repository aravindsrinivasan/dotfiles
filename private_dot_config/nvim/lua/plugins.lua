-- Packer
require('packer').startup(function()
  -- Packer manages itself.
  use 'wbthomason/packer.nvim'

  -- Syntax highlighting.
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- File explorer.
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }

  -- Fuzzy search.
  use {'junegunn/fzf', hook='./install --all' }
  use 'junegunn/fzf.vim'
  use 'airblade/vim-rooter'

  -- Status/Tab line.
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  -- Indentation guide line.
  use 'lukas-reineke/indent-blankline.nvim'

  -- Color scheme.
  use 'folke/tokyonight.nvim'
  use 'sainnhe/sonokai'
end)

-- Setup indent guide.
vim.opt.list = true
require("indent_blankline").setup {
  show_current_context = true,
  buftype_exclude = {"terminal"}
}

-- Setup color scheme.
vim.g.colors_name = 'tokyonight'

