return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp",
		"onsails/lspkind.nvim",
		{
			"williamboman/mason-lspconfig.nvim",
			opts = {
				-- IMPORTANT: List all the LSP servers you want Mason to install here!
				ensure_installed = {
					"ts_ls", -- Often preferred over 'ts_ls' for TypeScript LSP
					"eslint", -- Use 'eslint' for ESLint LSP
					"html",
					"lua_ls",
					"emmet_language_server",
					"tailwindcss", -- If you want Tailwind CSS LSP features
				},
				automatic_installation = true,
			},
		},

		{ "williamboman/mason.nvim", opts = {} },

		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			opts = {
				-- Keep tools like formatters and linters (that aren't LSPs themselves) here
				ensure_installed = {
					"stylua",
					"prettierd", -- Prettier daemon, often used with a formatter plugin like conform.nvim
				},
			},
		},
	},
	config = function()
		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.ERROR },
			signs = vim.g.have_nerd_font and {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
			} or {},
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
