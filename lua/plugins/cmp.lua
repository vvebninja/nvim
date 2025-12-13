return {
	{
		"saghen/blink.cmp",
		event = "VimEnter",
		version = "1.*",
		dependencies = {
			-- nvim-cmp MUST be a dependency of blink.cmp for Lazy.nvim to ensure it loads first.
			-- We don't need any 'opts' here for nvim-cmp itself, as blink.cmp manages it.
			"hrsh7th/nvim-cmp", -- Keep this here as a direct dependency for loading order

			{
				"L3MON4D3/LuaSnip",
				version = "2.*",
				build = (function()
					return "make install_jsregexp"
				end)(),
				dependencies = {
					{
						"rafamadriz/friendly-snippets",
						config = function()
							require("luasnip.loaders.from_vscode").lazy_load()
						end,
					},
				},
				opts = {},
			},
			"folke/lazydev.nvim",
		},
		config = function()
			local cmp = require("cmp")

			require("blink.cmp").setup({
				keymap = { preset = "default" },
				appearance = { nerd_font_variant = "mono" },
				completion = { documentation = { auto_show = false, auto_show_delay_ms = 500 } },
				sources = {
					default = { "lsp", "path", "snippets", "lazydev" },
					providers = { lazydev = { module = "lazydev.integrations.blink", score_offset = 100 } },
				},
				snippets = { preset = "luasnip" },
				fuzzy = { implementation = "lua" },
				signature = { enabled = true },
			})
		end,
	},
}
