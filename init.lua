require("config.g")
require("config.autocmd")
require("config.keymap")
require("config.opt")

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

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  checker = { enabled = true },
})

vim.cmd("highlight Cursor guifg=NONE guibg=#FF284D")
vim.cmd("highlight iCursor guifg=NONE guibg=#00ff00")
vim.cmd("highlight rCursor guifg=NONE guibg=#FF0000")
