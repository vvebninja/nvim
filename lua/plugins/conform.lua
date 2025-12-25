-- lua/plugins/formatting.lua
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
		-- 💡 High Cohesion: Grouping similar concerns
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

		-- Automatically assign prettierd to all web langs
		for _, lang in ipairs(prettier_langs) do
			formatters_by_ft[lang] = { "prettierd", "prettier", stop_after_first = true }
		end

		return {
			notify_on_error = false,
			formatters_by_ft = formatters_by_ft,
			format_on_save = function(bufnr)
				-- 💡 Low Coupling: Logic to bypass formatting
				local disable_filetypes = { c = true, cpp = true }
				
				-- Pro Tip: Ignore formatting if the file is in node_modules
				local bufname = vim.api.nvim_buf_get_name(bufnr)
				if bufname:match("/node_modules/") then
					return
				end

				if disable_filetypes[vim.bo[bufnr].filetype] then
					return
				end

				return {
					timeout_ms = 1000, -- Increased slightly for heavy TS files
					lsp_format = "fallback",
				}
			end,
		}
	end,
}
