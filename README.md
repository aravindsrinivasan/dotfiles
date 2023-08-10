# Dotfiles

## Neovim

Setup:
1. Install Neovim >= 0.9
2. Clone this repository. Copy all the files under `nvim/` to `.config/nvim` in your local machine
3. Run Neovim: `nvim`
4. The package manager `Lazy` should start and begin downloading the plugins. If not, run Lazy manually with `:Lazy`
5. After all the plugins are installed, we need to install third party tools like language servers, linters and formatters. We can do this with the Mason plugin. Start it with `:Mason`.
6. Install the following language servers with Mason (as required): pylsp, gopls, clangd
7. Install the following linters with Mason: ruff, shellcheck
8. Install the following formatters with Mason: ruff, shfmt
9. Close and reopen Neovim to apply the changes above.


Features:
**TODO: Add features supported by this config**

Note: This configuration has been tested on both Ubuntu and MacOS.
