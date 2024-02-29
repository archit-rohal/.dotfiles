-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.termguicolors = true  -- Enable true color support

vim.cmd("set expandtab")
vim.cmd("inoremap jk <esc>")
vim.cmd("nnoremap E :q!<cr>")
vim.cmd("set autochdir")
vim.cmd("set scrolloff=8")
vim.cmd("set relativenumber")
vim.cmd("set relativenumber")
vim.cmd("set numberwidth=3")
vim.cmd("set linebreak")
vim.cmd("set tabstop=4 softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")
vim.cmd("set smartindent")
vim.cmd("set path+=**")
vim.cmd("colorscheme rose-pine")
vim.g.lazy_updates = 0
vim.cmd("set wrap")

-- Turn off autoformat -
vim.g.autoformat = false
if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_transparency = 0.5
  vim.g.neovide_cursor_vfx_mode = "sonicboom"
  vim.g.neovide_scale_factor = 1.0
end
