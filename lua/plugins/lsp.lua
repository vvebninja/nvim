-- lua/lsp.lua
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

		local on_attach = function(client, bufnr)
			local opts = function(desc)
				return { buffer = bufnr, desc = "LSP: " .. desc }
			end

			-- Pro Global Keymaps: These now work for EVERY language
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to Definition"))
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("Go to References"))
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Hover Docs"))
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename Symbol"))
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code Action"))

			-- Language Specific Overrides (VTSLS only)
			if client.name == "vtsls" then
				vim.keymap.set("n", "<leader>mi", "<cmd>VtslsCommand add_missing_imports<CR>", opts("Missing Imports"))
				vim.keymap.set("n", "<leader>or", "<cmd>VtslsCommand organize_imports<CR>", opts("Organize Imports"))
			end
		end

		-- 🎨 2. Diagnostics UI
		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			virtual_text = { spacing = 4, prefix = "●" },
		})

		-- ⚙️ 3. Low Coupling: Automatic Server Setup
		-- Define all your servers and their unique settings here.
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

		require("mason-lspconfig").setup({
			ensure_installed = vim.tbl_keys(servers),
			handlers = {
				function(server_name)
					local server_opts = servers[server_name] or {}
					server_opts.capabilities = capabilities
					server_opts.on_attach = on_attach
					lspconfig[server_name].setup(server_opts)
				end,
			},
		})
	end,
}
