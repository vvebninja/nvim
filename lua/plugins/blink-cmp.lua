return {
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"folke/lazydev.nvim",
	},
	opts = {
		keymap = {
			preset = "enter",
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
		},

		appearance = { nerd_font_variant = "mono" },
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "lazydev" },
			providers = {
				lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
				buffer = { score_offset = -10 },
				lsp = {
					transform_items = function(_, items)
						for _, item in ipairs(items) do
							if item.kind == 5 or item.kind == 10 then
								item.score_offset = item.score_offset + 100
							end
						end
						return items
					end,
				},
			},
		},
		snippets = { preset = "luasnip" },
	},
}
