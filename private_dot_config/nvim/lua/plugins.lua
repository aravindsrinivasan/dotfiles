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

  -- Motion.
  use 'ggandor/lightspeed.nvim'

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

  -- Yank to system clipboard (including ssh sessions.)
  use 'ojroques/vim-oscyank'

  -- Git commands.
  use 'tpope/vim-fugitive'

  -- Github links for files.
  use {
    'ruifm/gitlinker.nvim',
    requires = 'nvim-lua/plenary.nvim',
  }

  -- Glow integration for markdown rendering.
  use "ellisonleao/glow.nvim"

  -- Gitsigns.
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'}
}

  -- Color scheme.
  use 'folke/tokyonight.nvim'
  use 'navarasu/onedark.nvim'

  -- Codeium code completion.
  -- use 'Exafunction/codeium.vim'

  -- Copilit code completion.
  use 'github/copilot.vim'
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
 require('onedark').setup{
   style = 'darker'
 }
 require('onedark').load()

-- Setup lualine.
require('lualine').setup {
  options = {
    theme = 'onedark'
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff',
                  {'diagnostics', sources={'nvim_lsp'}}},
    lualine_c = {
      {
        'filename',
        file_status = true,  -- displays file status (readonly status, modified status)
        path = 1,            -- 0 = just filename, 1 = relative path, 2 = absolute path
        shorting_target = 40 -- Shortens path to leave 40 space in the window
      }
    },
    lualine_x = {'filetype'},
    lualine_y = {'location'},
    lualine_z = {'progress'}
  },
  tabline = {
    lualine_a = {
      {
        'buffers',
        show_filename_only = true, -- shows shortened relative path when false
      }
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'tabs'}
  }
}

-- Nvim-tree setup.
require('nvim-tree').setup{
  view = {
    width = 50,
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
  },
  filters = {
    custom = {
      "bazel-.*", "external.*"
    },
  }
}

-- Setup Autopairs
require('nvim-autopairs').setup{}

-- Setup Treesitter.
require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "lua", "vim", "help", "python"},

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

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

  on_attach = function(bufnr)
    local function map(mode, lhs, rhs, opts)
        opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    -- Navigation
    map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
    map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

    -- Actions
    map('n', '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>')
    map('v', '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>')
    map('n', '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>')
    map('v', '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>')
    map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
    map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
    map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
    map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
    map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
    map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
    map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
    map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
    map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

    -- Text object
    map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}

-- Setup Gitlinker.
require("gitlinker").setup{
  opts = {
    remote = nil, -- force the use of a specific remote
    -- adds current line nr in the url for normal mode
    add_current_line_on_normal_mode = true,
    -- Copies the url into the clipboard via the @g reigster.
    action_callback = function(url)
      vim.api.nvim_command("let @g = '" .. url .. "'")
      vim.api.nvim_command("OSCYankRegister g")
    end,
    -- print the url after performing the action
    print_url = true,
  },
  callbacks = {
        ["github.com"] = require"gitlinker.hosts".get_github_type_url,
        ["gitent.corp.nuro.team"] = require"gitlinker.hosts".get_github_type_url,
  },
-- default mapping to call url generation with action_callback
  mappings = "<Leader>gy",
}
