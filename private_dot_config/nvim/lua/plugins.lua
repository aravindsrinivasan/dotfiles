-- Packer
require('packer').startup(function()
  -- Packer manages itself.
  use 'wbthomason/packer.nvim'

  -- Syntax highlighting.
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- LSP.
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp' -- Autocomplete plugin
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  -- File explorer.
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
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

  -- Comment out regions/lines.
  use 'tpope/vim-commentary'

  -- Autopairs
  use 'windwp/nvim-autopairs'

  -- Git commands.
  use 'tpope/vim-fugitive'
  -- Gitsigns.
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'}
}

  -- Color scheme.
  use 'folke/tokyonight.nvim'
  use 'navarasu/onedark.nvim'
end)

-- Setup indent guide.
vim.opt.list = true
require("indent_blankline").setup {
  show_current_context = true,
  filetype_exclude = {'help', 'packer'},
  buftype_exclude = {'terminal', 'nofile'},
  show_trailing_blankline_indent = false,
}

-- Setup color scheme.
 vim.g.onedark_style = 'darker'
 require('onedark').setup()

-- Setup lualine.
require('lualine').setup {
  options = {
    theme = 'onedark'
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

-- Setup Autopairs
require('nvim-autopairs').setup{}

-- Setup Treesitter.
require('nvim-treesitter.configs').setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}

-- Setup Gitsigns.
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,
  numhl      = true,
}

