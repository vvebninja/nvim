-- File: ~/.config/nvim/lua/plugins/blink-cmp.lua
return {
  "saghen/blink.cmp",
  version = "v1.*", -- Ensure you're on the stable v1 branch
  dependencies = {
    "L3MON4D3/LuaSnip",
    "folke/lazydev.nvim",
    "rafamadriz/friendly-snippets", -- 💎 Added the snippet collection
  },
  opts = {
    -- 'default' for 0.x, 'enter' or 'super-tab' for 1.x
    keymap = {
      preset = "enter",
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
    },

    appearance = {
      nerd_font_variant = "mono",
    },

    -- 💎 This section enables the preview window on the right
    completion = {
      documentation = {
        auto_show = true, -- Shows documentation when moving through items
        auto_show_delay_ms = 200, -- Delay before showing to keep it snappy
        window = {
          border = "rounded", -- Matches your LSP diagnostic theme
        },
      },
      -- Optional: list settings to make the menu look cleaner
      menu = {
        border = "rounded",
        draw = {
          columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
        },
      },
    },

    -- 💎 Added Signature Help (Experimental but stable in 2026)
    signature = { enabled = true },

    sources = {
      default = { "lsp", "path", "snippets", "buffer", "lazydev" },
      providers = {
        lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
        lsp = {
          name = "LSP",
          enabled = true,
          module = "blink.cmp.sources.lsp",
          -- Boost snippets and variables for better DX
          transform_items = function(_, items)
            for _, item in ipairs(items) do
              if item.kind == 5 or item.kind == 10 then
                item.score_offset = item.score_offset + 100
              end
            end
            return items
          end,
        },
      },
    },
    snippets = { preset = "luasnip" },
  },
  -- 🛠️ This section loads the actual snippets into memory
  config = function(_, opts)
    require("blink.cmp").setup(opts)
    -- Load VSCode-style snippets (like friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
