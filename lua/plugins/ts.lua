return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	opts = {
		settings = {
			-- This makes sure TSTools specific actions show up in the <leader>ca menu
			expose_as_code_action = "all",
			complete_function_calls = true,
			include_completions_with_insert_text = true,
			publish_diagnostic_on = "insert_leave",
			tsserver_plugins = {
				"typescript-plugin-css-modules",
			},
			tsserver_format_options = {
				allowTextChangesInNewFiles = true,
			},
		},
	},
	config = function(_, opts)
		-- Initialize the plugin with your opts
		require("typescript-tools").setup(opts)

		vim.keymap.set("n", ",mi", "<cmd>TSToolsAddMissingImports<cr>", { desc = "TS: Add Missing Imports" })
		vim.keymap.set("n", ",or", "<cmd>TSToolsOrganizeImports<cr>", { desc = "TS: Organize Imports" })
		vim.keymap.set("n", ",ru", "<cmd>TSToolsRemoveUnused<cr>", { desc = "TS: Remove Unused Variables" })
	end,
}
