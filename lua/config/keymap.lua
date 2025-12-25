-- 1. LSP / VTSLS (The Senior FE Toolkit)
-- Use 'vtsls' specific commands for better refactoring
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "LSP: Floating diagnostic" })
vim.keymap.set("n", "ca", "<cmd>VtslsCommand code_action_all<CR>", { desc = "VTSLS: Source Actions" })
vim.keymap.set("n", "<leader>mi", "<cmd>VtslsCommand add_missing_imports<CR>", { desc = "VTSLS: Add Missing Imports" })
vim.keymap.set("n", "<leader>rf", "<cmd>VtslsCommand rename_file<CR>", { desc = "VTSLS: Rename File" })
vim.keymap.set("n", "<leader>or", "<cmd>VtslsCommand organize_imports<CR>", { desc = "VTSLS: Organize Imports" })

-- 2. Navigation & Scrolling
-- Keep scrolling (C-j/k) and window movement (C-h/l/d/u) distinct
vim.keymap.set("n", "<C-j>", "<C-d>zz", { desc = "Scroll Down" })
vim.keymap.set("n", "<C-k>", "<C-u>zz", { desc = "Scroll Up" })

-- Window Movement (Using C-w prefix or direct maps)
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move focus Left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move focus Right" })
vim.keymap.set("n", "<C-d>", "<C-w>j", { desc = "Move focus Down" })
vim.keymap.set("n", "<C-u>", "<C-w>k", { desc = "Move focus Up" })

-- 3. Search & Utilities
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>d", "<cmd>TodoTelescope<CR>", { desc = "Find TODOs" }) -- Assuming you use Telescope

-- 4. Quick Exit
vim.keymap.set("n", "qq", "<cmd>q<CR>", { desc = "Quick quit" })
vim.keymap.set("n", "Q", "<cmd>qa!<CR>", { desc = "Force quit all" }) -- qa! is safer for monorepos

-- 5. Terminal (ToggleTerm)
local function toggle_term(id, dir, size)
	return string.format("<cmd>%dToggleTerm direction=%s size=%s<CR>", id, dir, size or "nil")
end

vim.keymap.set({ "n", "t" }, "<leader>t", toggle_term(1, "float"), { desc = "Toggle Floating Term" })
vim.keymap.set({ "n", "t" }, "<leader>gv", toggle_term(2, "vertical", "70"), { desc = "Toggle Vertical Term" })
vim.keymap.set({ "n", "t" }, "<leader>gh", toggle_term(3, "horizontal", "50"), { desc = "Toggle Horizontal Term" })
vim.keymap.set("n", "<leader>ga", "<cmd>ToggleTermToggleAll<cr>", { desc = "Toggle All Terms" })

-- Better terminal escape (prevents delay in apps like lazygit)
vim.keymap.set("t", "<C-Esc>", [[<C-\><C-n>]], { desc = "Exit Terminal Mode" })
