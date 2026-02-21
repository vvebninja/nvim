return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      ---@type lspconfig.options
      servers = {
        vtsls = {
          settings = {
            typescript = {
              updateImportsOnPaste = true,
            },
          },
          keys = {
            {
              "<leader>co",
              function()
                vim.lsp.buf.code_action({ apply = true, context = { only = { "source.organizeImports" } } })
              end,
              desc = "Organize Imports",
            },
            {
              "<leader>ci",
              function()
                vim.lsp.buf.code_action({ apply = true, context = { only = { "source.addMissingImports" } } })
              end,
              desc = "Add Missing Imports",
            },
          },
        },
        cspell_ls = {
          cmd = { "cspell-lsp", "--stdio" },
          filetypes = {
            "lua",
            "python",
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
