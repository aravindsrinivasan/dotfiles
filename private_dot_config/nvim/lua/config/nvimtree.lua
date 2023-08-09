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
