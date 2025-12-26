-- lua/plugins/tabout.lua
return {
  {
    "abecodes/tabout.nvim",
    -- 🚀 Pro Tip: Load on InsertEnter so it's ready exactly when you start typing
    event = "InsertEnter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("tabout").setup({
        tabkey = "<Tab>",
        backwards_tabkey = "<S-Tab>",
        act_as_tab = true,
        act_as_shift_tab = false,
        default_tab = "<C-t>",
        default_shift_tab = "<C-d>",
        enable_backwards = true,
        completion = false, -- We let blink.cmp handle completion
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = "`", close = "`" },
          { open = "(", close = ")" },
          { open = "[", close = "]" },
          { open = "{", close = "}" },
          -- Pro: Add JSX/TSX tags support
          { open = "<", close = ">" },
        },
        ignore_beginning = true,
        exclude = { "markdown" }, -- Tabbing out of quotes in markdown can be annoying
      })
    end,
  },
}
