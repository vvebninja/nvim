return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      ---@type lspconfig.options
      servers = {
        cspell_ls = {
          cmd = { "cspell-lsp", "--stdio" },
          filetypes = {
            "lua",
            "javascript",
            "typescriptreact",
            "html",
            "css",
            "json",
            "yaml",
            "markdown",
            "gitcommit",
          },
          root_markers = { ".git" },
        },
      },
    },
  },
}
