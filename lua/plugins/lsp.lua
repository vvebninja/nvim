-- File: ~/.config/nvim/lua/plugins/lsp.lua
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"yioneko/nvim-vtsls",
		"saghen/blink.cmp",
		"onsails/lspkind.nvim",
		{ "williamboman/mason.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			opts = { ensure_installed = { "stylua", "prettierd", "eslint_d" } },
		},
	},
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		local shared_on_attach = function(client)
			if client.name == "vtsls" then
				client.server_capabilities.documentFormattingProvider = false
			end
		end

		local servers = {
			vtsls = {
				settings = {
					typescript = {
						updateImportsOnFileMove = { enabled = "always" },
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

		-- 🎯 3. Initialization Engine
		require("mason-lspconfig").setup({
			ensure_installed = vim.tbl_keys(servers),
			handlers = {
				function(server_name)
					local server_opts = servers[server_name] or {}
					server_opts.capabilities = capabilities
					server_opts.on_attach = shared_on_attach

					-- 🚀 Standard setup for all servers
					lspconfig[server_name].setup(server_opts)
				end,
			},
		})
	end,
}
