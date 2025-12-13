vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

vim.keymap.set("n", "ca", "<cmd>LspTypescriptSourceAction<CR>", { desc = "Run LspTypescriptSourceAction Command" })
vim.keymap.set("n", "<leader>d", "<cmd>Todo<CR>", { desc = "Run Todo Command" })

vim.keymap.set("n", "<C-j>", "<C-d>zz")
vim.keymap.set("n", "<C-k>", "<C-u>zz")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-d>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-u>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "qq", ":q<CR>", { desc = "Quick quit" })
vim.keymap.set("n", "Q", ":q!<CR>", { desc = "Force quit" })

--Terminal toggle
vim.keymap.set("n", "<leader>t", "<cmd>1ToggleTerm direction=float<cr>", { desc = "Toggle Default Floating Terminal" })
vim.keymap.set(
	"t",
	"<leader>t",
	"<cmd>1ToggleTerm direction=float<cr>",
	{ desc = "Toggle Default Floating Terminal (from within term)" }
)

vim.keymap.set(
	"n",
	"<leader>gv",
	"<cmd>2ToggleTerm size=70% direction=vertical<cr>",
	{ desc = "Toggle Vertical Split Term (50% width)" }
)
vim.keymap.set(
	"t",
	"<leader>gv",
	"<cmd>2ToggleTerm size=70% direction=vertical<cr>",
	{ desc = "Toggle Vertical Split Term (from within term)" }
)

vim.keymap.set(
	"n",
	"<leader>gh",
	"<cmd>3ToggleTerm size=50% direction=horizontal<cr>",
	{ desc = "Toggle Horizontal Split Term (50% height)" }
)
vim.keymap.set(
	"t",
	"<leader>gh",
	"<cmd>3ToggleTerm size=80% direction=horizontal<cr>",
	{ desc = "Toggle Horizontal Split Term (from within term)" }
)
vim.keymap.set("n", "<leader>ga", "<cmd>ToggleTermToggleAll<cr>", { desc = "Toggle All Terminals" })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit Terminal Mode" })
