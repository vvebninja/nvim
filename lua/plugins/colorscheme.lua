return {
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("onedark").setup({
        style = "darker",
      })
      require("onedark").load()
    end,
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = {
      transparent = false,
      styles = {
        sidebars = "transparent",
        floats = "transparent", -- Прозорі плаваючі вікна
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
