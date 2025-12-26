-- lua/plugins/conform.lua
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = { "n", "v" }, -- Added visual mode for formatting blocks
      desc = "Format buffer or selection",
    },
  },
  opts = function()
    local prettier_langs = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "vue",
      "css",
      "scss",
      "less",
      "html",
      "json",
      "yaml",
      "markdown",
    }

    local formatters_by_ft = {
      lua = { "stylua" },
    }

    for _, lang in ipairs(prettier_langs) do
      formatters_by_ft[lang] = { "prettierd", "prettier", stop_after_first = true }
    end

    return {
      notify_on_error = false,
      formatters_by_ft = formatters_by_ft,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }

        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if bufname:match("/node_modules/") then
          return
        end

        if disable_filetypes[vim.bo[bufnr].filetype] then
          return
        end

        return {
          timeout_ms = 300,
          lsp_format = "fallback",
        }
      end,
    }
  end,
}
