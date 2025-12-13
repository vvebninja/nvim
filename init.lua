local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- ✅ Automatically require all files in lua/config/
local config_dir = vim.fn.stdpath("config") .. "/lua/config"
for _, file in ipairs(vim.fn.readdir(config_dir)) do
	if file:match("^[^.]") and file:match("%.lua$") and file ~= "init.lua" then
		local module = "config." .. file:gsub("%.lua$", "")
		require(module)
	end
end

require("lazy").setup("plugins", {})

vim.cmd("highlight Cursor guifg=NONE guibg=#FF284D")
vim.cmd("highlight iCursor guifg=NONE guibg=#00ff00")
vim.cmd("highlight rCursor guifg=NONE guibg=#FF0000")
-- vim.cmd("highlight Normal guibg=NONE")
