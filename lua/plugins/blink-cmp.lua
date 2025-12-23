return {
  "saghen/blink.cmp",
  version = "1.*",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "folke/lazydev.nvim",
  },
  -- Lazy.nvim will automatically call require("blink.cmp").setup(opts)
  opts = {
    keymap = { preset = "default" },
    appearance = { nerd_font_variant = "mono" },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "lazydev" },
      providers = {
        lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
        -- The "Pro" way to push text to the bottom
        buffer = { score_offset = -10 },
        lsp = {
          -- This is the fix for seeing object properties first!
          transform_items = function(_, items)
            for _, item in ipairs(items) do
              -- Kind 5 (Field) and Kind 10 (Property) get boosted
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
}
