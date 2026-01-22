return {
  {
    'akinsho/toggleterm.nvim',
    version = '*', -- Use "v1.*" for latest stable, or "*" for latest commit
    config = function()
      require('toggleterm').setup {
        -- General settings for all terminals
        size = 40, -- Default size for horizontal/vertical if not overridden by specific mapping
        open_mapping = [[<leader>t]], -- This will be mapped to the default (index 1) float terminal
        hide_numbers = true,
        shade_terminals = true,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true, -- Remember the size of the terminal when hidden
        direction = 'float', -- Default direction for the 'open_mapping' and if no direction is specified

        -- Default float options (will apply to <leader>t)
        float_opts = {
          border = 'curved',
          width = 140, -- Default width for floating terminals
          height = 25, -- Default height for floating terminals
        },
        close_on_exit = true, -- Close the terminal window when the process exits
      }

      -- === Specific Keybindings for Separate Terminal Instances ===

      -- 1. Floating Terminal (Index 1)
      -- This will be the "default" instance, toggled by <leader>t
      vim.keymap.set('n', '<leader>t', '<cmd>1ToggleTerm direction=float<cr>', { desc = 'Toggle Default Floating Terminal' })
      vim.keymap.set('t', '<leader>t', '<cmd>1ToggleTerm direction=float<cr>', { desc = 'Toggle Default Floating Terminal (from within term)' })

      -- 2. Vertical Split Terminal (Index 2) - 70% width
      vim.keymap.set('n', '<leader>gv', '<cmd>2ToggleTerm size=70% direction=vertical<cr>', { desc = 'Toggle Vertical Split Term (70% width)' })
      vim.keymap.set('t', '<leader>gv', '<cmd>2ToggleTerm size=70% direction=vertical<cr>', { desc = 'Toggle Vertical Split Term (from within term)' })

      -- 3. Horizontal Split Terminal (Index 3) - 80% height
      vim.keymap.set('n', '<leader>gh', '<cmd>3ToggleTerm size=80% direction=horizontal<cr>', { desc = 'Toggle Horizontal Split Term (80% height)' })
      vim.keymap.set('t', '<leader>gh', '<cmd>3ToggleTerm size=80% direction=horizontal<cr>', { desc = 'Toggle Horizontal Split Term (from within term)' })

      -- Optional: Keybinding to toggle ALL open toggleterm instances
      vim.keymap.set('n', '<leader>ga', '<cmd>ToggleTermToggleAll<cr>', { desc = 'Toggle All Terminals' })

      -- IMPORTANT: Keybinding to exit terminal mode back to Normal mode
      vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit Terminal Mode' })
    end,
  },
}
