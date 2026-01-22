return {
	"saghen/blink.cmp",
	version = "v0.*",
	build = "cargo build --release",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets", -- ДОБАВЬ ЭТО, чтобы сниппеты были в системе
		"folke/lazydev.nvim",
		"onsails/lspkind.nvim",
	},
	opts = {
		keymap = {
			preset = "enter",
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		snippets = {
			preset = "luasnip",
		},
		completion = {
			menu = {
				border = "rounded",
				draw = {
					columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
					components = {
						kind_icon = {
							ellipsis = false,
							text = function(ctx)
								-- Безопасное получение иконки
								local lspkind = require("lspkind")
								local icon = lspkind.symbol_map[ctx.kind] or " "
								return icon .. " "
							end,
							highlight = function(ctx)
								return "BlinkCmpKind" .. ctx.kind
							end,
						},
					},
				},
			},
			documentation = {
				auto_show = true,
				window = { border = "rounded" },
			},
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
}
