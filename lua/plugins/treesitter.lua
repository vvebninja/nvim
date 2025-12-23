return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"bash",
			"html",
			"lua",
			"markdown",
			"vim",
			"javascript",
			"tsx",
			"typescript",
		},
		highlight = {
			enable = true,
			-- Setting this to false prevents the "Syntax" engine
			-- from fighting Tree-sitter for control.
			additional_vim_regex_highlighting = false,
		},
	},
}
