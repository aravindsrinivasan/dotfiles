return {
  -- Syntax highlighting.
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'BufReadPost',
    config = function()
      require 'config.treesitter'
    end,
  },
  -- Additional textobjects for treesitter
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = 'nvim-treesitter/nvim-treesitter',
  },

  -- LSP.
   'neovim/nvim-lspconfig',
   'hrsh7th/nvim-cmp',
   'hrsh7th/cmp-nvim-lsp',
   'saadparwaiz1/cmp_luasnip',
   'L3MON4D3/LuaSnip',

  -- External tooling manager
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },

  -- Null LS
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      local null_ls = require('null-ls')
      null_ls.setup({
        sources = {
          -- Python
          null_ls.builtins.formatting.ruff,
          null_ls.builtins.formatting.black,
          null_ls.builtins.diagnostics.ruff,

          -- Shell
          null_ls.builtins.diagnostics.shellcheck,
          null_ls.builtins.code_actions.shellcheck,
          null_ls.builtins.formatting.shfmt,
        }
      })
    end,
  },

  -- File explorer.
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = function()
          require 'config.nvimtree'
    end,
  },

  -- Motion.
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end,
  },

  -- Fuzzy search.
   {'junegunn/fzf', hook='./install --all' },
   'junegunn/fzf.vim',
   'airblade/vim-rooter',

  -- Status/Tab line.
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = function()
      require 'config.lualine'
      end,
  },

  -- Indentation guide line.
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      require('ibl').setup()
    end,
  },

  -- Comment out regions/lines.
   'tpope/vim-commentary',

  -- Autopairs
   {'windwp/nvim-autopairs', opts = {}},

  -- Yank to system clipboard (including ssh sessions.)
   'ojroques/vim-oscyank',

  -- Git commands.
   'tpope/vim-fugitive',

  -- Github links for files.
  {
    'ruifm/gitlinker.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require 'config.gitlinker'
      end,
  },

  -- Glow integration for markdown rendering.
   {'ellisonleao/glow.nvim', config = true, cmd = 'Glow'},

  -- Gitsigns.
  {
    'lewis6991/gitsigns.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require 'config.gitsigns'
    end,
  },

  -- Color scheme.
   'folke/tokyonight.nvim',
  -- Make sure the color scheme is loaded first.
  {
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'darker'
      }
      require('onedark').load()
    end,
  },

  -- Codeium code completion.
  --  'Exafunction/codeium.vim'

  -- Copilot code completion.
   'github/copilot.vim',
}
