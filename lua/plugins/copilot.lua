return {
	-- 1. Автодополнение
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					hide_during_completion = true,
					keymap = {
						accept = "<M-l>",
						accept_word = "<M-w>",
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
				panel = { enabled = false },
			})
		end,
	},

	-- 2. Чат (Стильный сайдбар справа)
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim" },
		},
		opts = {
			debug = false,
			question_header = "   User ",
			answer_header = "   Copilot ",
			error_header = " 󰚌  Error ",
			separator = "───",
			show_help = false,

			window = {
				layout = "float", -- Оставляем float для рамок
				relative = "editor", -- Считаем координаты от всего окна
				anchor = "NE", -- Привязка к North-East (верхний правый угол)
				col = vim.o.columns, -- Максимально вправо
				row = 1, -- Небольшой отступ сверху
				width = 0.45, -- Занимает 35% ширины экрана
				height = 1.0, -- Занимает 85% высоты
				border = "rounded", -- Те самые скругленные углы
				title = " Copilot Chat ",
			},
		},
		keys = {
			{
				"<leader>c",
				function()
					require("CopilotChat").toggle()
				end,
				desc = "CopilotChat - Toggle",
			},
		},
	},
}
