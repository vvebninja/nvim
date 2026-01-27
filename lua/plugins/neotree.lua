return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"mrbjarksen/neo-tree-diagnostics.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	keys = {
		{ ",e", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
	},
	opts = {
		-- Убираем лишние символы для чистоты
		default_component_configs = {
			indent = {
				with_expanders = true, -- Чтобы было видно вложенность
				expander_collapsed = "",
				expander_expanded = "",
			},
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "󰜌",
			},
		},
		filesystem = {
			window = {
				mappings = {
					[",e"] = "close_window",
				},
			},
			hijack_netrw_behavior = "disabled",
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = false,
			},
		},
		-- ⚡️ Твои любимые номера строк в сайдбаре
		event_handlers = {
			{
				event = "neo_tree_buffer_enter",
				handler = function()
					vim.opt_local.number = true
					vim.opt_local.relativenumber = true
				end,
			},
		},
		enable_git_status = true,
		enable_diagnostics = true,
		window = {
			position = "left",
			width = 34,
		},
	},
}
