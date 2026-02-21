-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.o.mouse = ""
vim.opt.swapfile = false
vim.diagnostic.config({
  float = {
    border = "rounded", -- Можна вибрати 'rounded', 'single', 'double' або 'shadow'
    source = "always",
    header = "",
    prefix = "●", -- Символ перед кожною помилкою
    scope = "cursor", -- Показувати помилку лише під курсором
  },
})
