return {
  {
    'abecodes/tabout.nvim',
    event = 'InsertEnter', -- Load when you start typing
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      tabkey = '<Tab>', -- Key to tab out
      backspace_tabkey = '<S-Tab>', -- Key to tab back
      act_as_tab = true, -- Shift-tab inside empty pair still works as tab
      act_as_shift_tab = false,
      default_tab = '<C-t>', -- What to do if we aren't at a "tabout" point
      default_shift_tab = '<C-d>',
      enable_backwards = true,
      completion = true, -- Set to true if you want it to work with autocomplete
      tabouts = {
        { open = "'", close = "'" },
        { open = '"', close = '"' },
        { open = '`', close = '`' },
        { open = '(', close = ')' },
        { open = '[', close = ']' },
        { open = '{', close = '}' },
        { open = '<', close = '>' }, -- Critical for your TSX tags!
      },
      ignore_beginning = true,
      exclude = {},
    },
  },
}
