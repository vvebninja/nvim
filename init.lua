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
--
if vim.fn.executable("fish") == 1 then
    vim.opt.shell = "fish"
end


-- -- 🎨 High Cohesion: All syntax surgical overrides in one place
-- local function setup_minimalist_syntax()
--   local c = require("tokyonight.colors").setup()
--
--   -- We use a color that blends into the background for "noise"
--   local muted = c.dark3 -- Very subtle gray
--
--   local highlights = {
--     -- 🚫 MUTE: Brackets, Braces, Parens
--     ["@punctuation.bracket"] = { fg = muted },
--     ["@punctuation.delimiter"] = { fg = muted }, -- Commas, semicolons
--     ["@punctuation.special"] = { fg = muted }, -- Object dots (.)
--
--     -- 🚫 MUTE: Quotes and Operators
--     ["@string.delimiter"] = { fg = muted }, -- The "" in strings
--     ["@operator"] = { fg = muted }, -- =, +, -, etc.
--
--     -- ✨ BOOST: JSX/HTML Tags (The focus)
--     ["@tag"] = { fg = c.magenta, bold = true }, -- <div>, <Component>
--     ["@tag.delimiter"] = { fg = c.cyan }, -- The < and > brackets
--     ["@tag.attribute"] = { fg = c.yellow }, -- className, onClick
--     ["@tag.builtin"] = { fg = c.red }, -- Built-in HTML (div, span)
--   }
--
--   for group, settings in pairs(highlights) do
--     vim.api.nvim_set_hl(0, group, settings)
--   end
-- end
--
-- -- Run it and ensure it sticks after theme changes
-- setup_minimalist_syntax()
-- vim.api.nvim_create_autocmd("ColorScheme", {
--   callback = setup_minimalist_syntax,
-- })
