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
