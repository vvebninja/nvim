vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.opt.swapfile = false
vim.g.have_nerd_font = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = ""
vim.o.showmode = false

vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 500
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = false
vim.opt.listchars:remove("tab")
vim.o.inccommand = "split"
vim.o.cursorline = true
vim.o.scrolloff = 0
vim.o.confirm = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.opt.cmdheight = 0
vim.opt.shortmess:append("IcWA")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.opt.cmdheight = 0
	end,
})
