return {
	"Mofiqul/vscode.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local vscode = require("vscode")

		vscode.setup({
			style = "dark",
			terminal_colors = true,
			-- Устанавливаем твой любимый цвет на фон
			color_overrides = {
				-- vscBack = '#1E1E2E',
			},
			group_overrides = {
				["tsxTagName"] = { fg = "#4ec9b0", bold = false },
				["tsxCloseString"] = { fg = "#808080" },
				["typescriptBlock"] = { fg = "#586e75" },
				-- Если переменные base1 и cyan не определены выше в твоем файле,
				-- лучше заменить их на HEX, иначе Neovim выдаст ошибку.
				-- ['@tag.delimiter'] = { fg = '#839496' },
				-- ['typescriptArrowFunc'] = { fg = '#00bcd4' },
			},
		})
		vim.cmd.colorscheme("vscode")
	end,
}
