return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
	dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		local ls = require("luasnip")

		require("luasnip.loaders.from_vscode").lazy_load()

		ls.filetype_extend("typescriptreact", { "javascriptreact", "javascript", "typescript" })
		ls.filetype_extend("javascriptreact", { "javascript" })

		ls.config.set_config({
			history = true,
			updateevents = "TextChanged,TextChangedI",
		})
	end,
}
