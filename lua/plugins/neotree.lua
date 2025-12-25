return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"mrbjarksen/neo-tree-diagnostics.nvim",
		"echasnovski/mini.icons",
		"nvim-tree/nvim-web-devicons",
		"ryanoasis/vim-devicons",
		"MunifTanjim/nui.nvim",
		"antosha417/nvim-lsp-file-operations",
	},
	lazy = false,
	opts = {
		filesystem = {
			hijack_netrw_behavior = "disabled",
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = true,
			},
			bind_to_cwd = false,
			follow_current_file = { enabled = true }, -- 💡 Let Neotree handle the heavy lifting
			use_libuv_file_watcher = true,
		},
		window = {
			position = "right",
			width = 35,
		},
	},
	config = function(_, opts)
		require("lsp-file-operations").setup()
		require("neo-tree").setup(opts)
	end,
}
