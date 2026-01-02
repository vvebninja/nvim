vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "LSP: Floating diagnostic" })
vim.keymap.set("n", "<leader>e", "<cmd>Neotree filesystem reveal right toggle<cr>", { desc = "Explorer" })

vim.keymap.set("n", "<leader>mi", "<cmd>VtsExec add_missing_imports<CR>", { desc = "Add Missing Imports" })
vim.keymap.set("n", "<leader>or", "<cmd>VtsExec organize_imports<CR>", { desc = "Organize Imports" })
vim.keymap.set("n", "<leader>rf", "<cmd>VtsExec rename_file<CR>", { desc = "Rename File" })
vim.keymap.set("n", "<leader>fa", "<cmd>VtsExec fix_all<CR>", { desc = "Fix All" })
vim.keymap.set("n", "ca", "<cmd>VtsExec source_actions<CR>", { desc = "Code actions" })
vim.keymap.set("n", "gD", "<cmd>VtslsExec goto_source_definition<CR>", { desc = "Goto Source Definition" })
vim.keymap.set("n", "<leader>e", "<cmd>Neotree filesystem reveal right toggle<cr>", { desc = "Explorer" })

-- Extract function/variable (Visual Mode)
vim.keymap.set("x", "<leader>re", function()
  require("refactoring").refactor("Extract Function")
end, { desc = "Extract Function" })

vim.keymap.set("x", "<leader>rf", function()
  require("refactoring").refactor("Extract Function To File")
end, { desc = "Extract To File" })

vim.keymap.set("x", "<leader>rv", function()
  require("refactoring").refactor("Extract Variable")
end, { desc = "Extract Variable" })

-- Inline variable (Normal Mode)
vim.keymap.set("n", "<leader>ri", function()
  require("refactoring").refactor("Inline Variable")
end, { desc = "Inline Variable" })

-- This opens a Snacks-like menu to pick which refactor you want
vim.keymap.set({ "n", "x" }, "<leader>rr", function()
  require("refactoring").select_refactor()
end, { desc = "Refactor Menu" })

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
--
-- 2. Navigation & Scrolling
vim.keymap.set("n", "<C-j>", "<C-d>zz", { desc = "Scroll Down" })
vim.keymap.set("n", "<C-k>", "<C-u>zz", { desc = "Scroll Up" })

-- Window Movement (Using C-w prefix or direct maps)
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move focus Left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move focus Right" })
vim.keymap.set("n", "<C-d>", "<C-w>j", { desc = "Move focus Down" })
vim.keymap.set("n", "<C-u>", "<C-w>k", { desc = "Move focus Up" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
-- 3. Search & Utilities
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>d", "<cmd>TodoTelescope<CR>", { desc = "Find TODOs" }) -- Assuming you use Telescope

-- 4. Quick Exit
vim.keymap.set("n", "qq", "<cmd>q<CR>", { desc = "Quick quit" })
vim.keymap.set("n", "Q", "<cmd>qa!<CR>", { desc = "Force quit all" })

-- Better terminal escape (prevents delay in apps like lazygit)
vim.keymap.set("t", "<C-Esc>", [[<C-\><C-n>]], { desc = "Exit Terminal Mode" })

-- Hover and Rename
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
--
-- 2. Navigation & Scrolling
vim.keymap.set("n", "<C-j>", "<C-d>zz", { desc = "Scroll Down" })
vim.keymap.set("n", "<C-k>", "<C-u>zz", { desc = "Scroll Up" })

-- Window Movement (Using C-w prefix or direct maps)
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move focus Left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move focus Right" })
vim.keymap.set("n", "<C-d>", "<C-w>j", { desc = "Move focus Down" })
vim.keymap.set("n", "<C-u>", "<C-w>k", { desc = "Move focus Up" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
-- 3. Search & Utilities
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>d", "<cmd>TodoTelescope<CR>", { desc = "Find TODOs" }) -- Assuming you use Telescope

-- 4. Quick Exit
vim.keymap.set("n", "qq", "<cmd>q<CR>", { desc = "Quick quit" })
vim.keymap.set("n", "Q", "<cmd>qa!<CR>", { desc = "Force quit all" })

-- Better terminal escape (prevents delay in apps like lazygit)
vim.keymap.set("t", "<C-Esc>", [[<C-\><C-n>]], { desc = "Exit Terminal Mode" })

vim.keymap.set("n", "K", function()
  vim.lsp.buf.hover()
end, { desc = "Beautiful Hover" })
