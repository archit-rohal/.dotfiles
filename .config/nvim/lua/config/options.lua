-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.showcmd = true
vim.opt.cmdheight = 0
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.backspace = {"start", "eol", "indent"}
vim.opt.path:append({"**"})
vim.opt.wildignore:append({"*/node_modules/*"})
vim.opt.splitkeep = "cursor"
vim.opt.formatoptions:append({"r"})
