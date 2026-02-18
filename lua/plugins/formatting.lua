return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- Biome для JS/TS стеку
        javascript = { "biome" },
        typescript = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
        json = { "biome" },
        -- Prettier для всього іншого
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        markdown = { "prettier" },
        yaml = { "prettier" },
      },
    },
  },
}
