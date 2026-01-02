-- File: ~/.config/nvim/lua/plugins/noice.lua
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {
    lsp = {
      hover = { enabled = true },
      signature = { enabled = true },
      -- ⚡ This overrides the internal markdown styling
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
      },
    },
    presets = {
      lsp_doc_border = true, -- 💎 Forces the rounded border
    },
    views = {
      hover = {
        border = {
          style = "rounded", -- 💎 Rounded corners
          padding = { 1, 2 }, -- 💡 Padding makes it look premium
        },
        position = { row = 2, col = 2 },
        size = { max_width = 80 },
      },
    },
  },
}
