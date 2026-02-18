-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Додає закруглені рамки для всіх спливаючих вікон LSP
-- Налаштування стилю плаваючих вікон діагностики
vim.diagnostic.config({
  float = {
    border = "rounded", -- Можна вибрати 'rounded', 'single', 'double' або 'shadow'
    source = "always", -- Показує джерело (ESLint, TypeScript тощо)
    header = "", -- Прибираємо стандартний заголовок для мінімалізму
    prefix = "● ", -- Символ перед кожною помилкою
    scope = "cursor", -- Показувати помилку лише під курсором
  },
})
