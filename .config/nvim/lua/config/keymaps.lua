-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>p", ":w!<CR>", { desc = "Force save" })
vim.keymap.set("i", "jk", "<esc>", {})
vim.keymap.set("n", "E", ":q!<CR>", { desc = "Force quit" })
vim.keymap.set("v", "<leader>u", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>j", ":!node foo.js<CR>", { desc = "Run foo.js" })
vim.keymap.set("n", "<leader>a", "ggVGd", { desc = "Clear all lines" })
vim.keymap.set("n", "<leader>cs", ":Copilot suggestion<CR>", { desc = "Copilot suggest" });
