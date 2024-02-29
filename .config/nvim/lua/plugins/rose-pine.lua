return {
  { "rose-pine/neovim", name = "rose-pine" },
  lazy = true,
  priority = 1000, -- make sure to load this before all the other start plugins
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
