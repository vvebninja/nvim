return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	-- Сборка библиотеки для Fedora/Ubuntu
	build = "make install_jsregexp",
	dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		local ls = require("luasnip")

		-- 1. Загружаем сниппеты из friendly-snippets (VSCode style)
		require("luasnip.loaders.from_vscode").lazy_load()

		-- 2. Расширяем типы файлов для React (как советовали на Habr)
		-- Чтобы в .tsx работали сниппеты из .js и .jsx
		ls.filetype_extend("typescriptreact", { "javascriptreact", "javascript", "typescript" })
		ls.filetype_extend("javascriptreact", { "javascript" })

		-- 3. Настройка (необязательно, но полезно)
		ls.config.set_config({
			history = true,
			updateevents = "TextChanged,TextChangedI",
		})
	end,
}
