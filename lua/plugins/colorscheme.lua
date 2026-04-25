return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    config = function()
      require("onedarkpro").setup({
        options = {
          transparency = false,
          cursorline = true,
          highlight_semantic_tokens = true,
        },
        colors = {
          onedark = {
            bg = "#16191d",
            fg = "#abb2bf",
            red = "#e06c75",
            yellow = "#e5c07b",
            orange = "#d19a66",
          },
        },
        highlights = {
          -- 1. MATCH NEOTREE BG TO EDITOR/TAB BG
          NeoTreeNormal = { bg = "#16191d" },
          NeoTreeNormalNC = { bg = "#16191d" }, -- NC = Non-Current (when focus is elsewhere)
          NeoTreeWinSeparator = { fg = "#16191d", bg = "#16191d" },

          -- 2. MATCH THE "BAR" ABOVE NEOTREE (The Offset)
          -- This ensures the space above the file tree matches the tree itself
          BufferLineOffsetSeparator = { fg = "#16191d", bg = "#16191d" },
          BufferLineFill = { bg = "#16191d" }, -- This is the background of the empty tab bar area

          -- 3. HIDE BORDERS
          WinSeparator = { fg = "#16191d", bg = "#16191d" },
          VertSplit = { fg = "#16191d", bg = "#16191d" },

          -- [Syntax Highlights from previous steps]
          ["@tag"] = { fg = "#e06c75" },
          ["@tag.builtin"] = { fg = "#e06c75" },
          ["@tag.tsx"] = { fg = "#e5c07b" },
          ["@tag.javascript"] = { fg = "#e5c07b" },
          ["@tag.attribute"] = { fg = "#d19a66" },

          -- [UI Elements]
          LineNr = { fg = "#667187" },
          CursorLineNr = { fg = "#abb2bf" },
          NormalFloat = { bg = "#1e2227" },
          FloatBorder = { fg = "#3e4452", bg = "#1e2227" },
        },
      })
      vim.cmd("colorscheme onedark")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
