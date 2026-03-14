return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<leader>t]], -- This will be mapped to the default (index 1) float terminal
        hide_numbers = true,
        shade_terminals = true,
        start_in_insert = true,
        insert_mappings = false,
        terminal_mappings = true,
        persist_size = true, -- Remember the size of the terminal when hidden
        direction = "float", -- Default direction for the 'open_mapping' and if no direction is specified

        -- Default float options (will apply to <leader>t)
        float_opts = {
          border = "curved",
          width = 140,
          height = 35,
        },
      })

      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
      end

      vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
    end,
  },
}
