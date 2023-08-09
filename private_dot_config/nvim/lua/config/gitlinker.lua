require("gitlinker").setup{
  opts = {
    remote = nil, -- force the  of a specific remote
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
