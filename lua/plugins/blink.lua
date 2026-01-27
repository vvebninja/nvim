return {
	"saghen/blink.cmp",
	version = "v0.*",
	build = "cargo build --release",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		"folke/lazydev.nvim",
		"onsails/lspkind.nvim",
		"saghen/blink.compat",
		"giuxtaposition/blink-cmp-copilot",
	},
	opts = {
		keymap = {
			preset = "enter",
		},
		signature = { enabled = false },
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
			kind_icons = {
				Copilot = "",
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "copilot" },
			providers = {
				copilot = {
					name = "copilot",
					module = "blink-cmp-copilot",
					score_offset = 100,
					async = true,
				},
			},
		},
		snippets = {
			preset = "luasnip",
		},
		completion = {
			menu = {
				border = "rounded",
			},
			documentation = {
				auto_show = true,
				window = {
					border = "rounded",
					min_width = 20,
					max_width = 60,
				},
			},
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
}
