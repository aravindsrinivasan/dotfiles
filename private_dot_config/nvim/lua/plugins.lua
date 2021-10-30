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
  use {
  'nvim-lualine/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

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

-- Setup lualine.
require('lualine').setup {
  options = {
    theme = 'tokyonight'
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff',
                  {'diagnostics', sources={'nvim_lsp', 'coc'}}},
    lualine_c = {},
    lualine_x = {'filetype'},
    lualine_y = {'location'},
    lualine_z = {'progress'}
  },
  tabline = {
    lualine_a = {'buffers'},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'tabs'}
  }
}

