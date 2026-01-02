return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "yioneko/nvim-vtsls",
    "saghen/blink.cmp",
    "onsails/lspkind.nvim",
    { "williamboman/mason.nvim", opts = {} },
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")

    local shared_on_attach = function(client)
      if client.name == "vtsls" then
        client.server_capabilities.documentFormattingProvider = false
      end
    end

    local servers = {
      vtsls = {
        settings = {
          vtsls = {
            experimental = {
              completion = {
                enableServerSideFuzzyMatch = true,
              },
            },
          },
          typescript = {
            updateImportsOnFileMove = { enabled = "always" },
            suggest = {
              completeFunctionCalls = true,
            },
            inlayHints = {
              parameterNames = { enabled = "literals" },
              variableTypes = { enabled = true },
            },
          },
        },
      },
      lua_ls = { settings = { Lua = { diagnostics = { globals = { "vim" } } } } },
      eslint = {},
      tailwindcss = {},
      html = {},
      emmet_language_server = {},
    }

    require("mason-lspconfig").setup({
      ensure_installed = vim.tbl_keys(servers),
      handlers = {
        function(server_name)
          local server_opts = servers[server_name] or {}

          -- ⚡ Properly inject blink capabilities
          server_opts.capabilities = require("blink.cmp").get_lsp_capabilities(server_opts.capabilities)
          server_opts.on_attach = shared_on_attach

          lspconfig[server_name].setup(server_opts)
        end,
      },
    })

    -- Diagnostic Config
    -- See :help vim.diagnostic.Opts
    vim.diagnostic.config({
      severity_sort = true,
      float = {
        border = "rounded", -- Modern rounded corners
        source = "always", -- Shows if it's from 'vtsls', 'eslint', etc.
        header = "", -- Removes the "Diagnostics:" header for a cleaner look
        prefix = "",
        focusable = true, -- 💡 Allows you to press 'gl' again to enter and scroll
        max_width = 80, -- Keeps long errors from spanning the whole screen
      },
      underline = { severity = vim.diagnostic.severity.ERROR },
      -- 💡 Removed the 'vim.g.have_nerd_font' check to force icons back
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅚 ",
          [vim.diagnostic.severity.WARN] = "󰀪 ",
          [vim.diagnostic.severity.INFO] = "󰋽 ",
          [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
      },
      virtual_text = {
        source = "if_many",
        spacing = 2,
        format = function(diagnostic)
          local diagnostic_message = {
            [vim.diagnostic.severity.ERROR] = diagnostic.message,
            [vim.diagnostic.severity.WARN] = diagnostic.message,
            [vim.diagnostic.severity.INFO] = diagnostic.message,
            [vim.diagnostic.severity.HINT] = diagnostic.message,
          }
          return diagnostic_message[diagnostic.severity]
        end,
      },
    })
  end,
}
