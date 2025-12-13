return {
	"ackeraa/todo.nvim",
	config = function()
		require("todo").setup({
			opts = {
				file_path = "../../todo.txt",
			},
		})
	end,
}
