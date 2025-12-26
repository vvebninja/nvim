local map = function(keys, func, desc, mode)
  mode = mode or "n"
  vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
end

map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
