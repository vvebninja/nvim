vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-d>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-u>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<C-j>", "<C-d>zz")
vim.keymap.set("n", "<C-k>", "<C-u>zz")

vim.keymap.set("n", "qq", ":q<CR>", { desc = "Quick quit" })
vim.keymap.set("n", "Q", ":q!<CR>", { desc = "Force quit" })

vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "LSP: Floating diagnostic" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "ca", vim.lsp.buf.code_action, { desc = "Code Action" })
