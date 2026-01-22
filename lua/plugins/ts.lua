return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  config = function(_, opts)
    -- Initialize the plugin with your opts
    require('typescript-tools').setup(opts)

    -- 1. Code Actions & Quick Fixes (The most important one!)
    -- This will show a menu for: missing imports, fixing typos, etc.
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction / Quick Fix' })

    -- 2. Your specific TSTools mappings
    vim.keymap.set('n', ',mi', '<cmd>TSToolsAddMissingImports<cr>', { desc = 'TS: Add Missing Imports' })
    vim.keymap.set('n', ',or', '<cmd>TSToolsOrganizeImports<cr>', { desc = 'TS: Organize Imports' })
    vim.keymap.set('n', ',ru', '<cmd>TSToolsRemoveUnused<cr>', { desc = 'TS: Remove Unused Variables' })
  end,
  opts = {
    settings = {
      -- This makes sure TSTools specific actions show up in the <leader>ca menu
      expose_as_code_action = 'all',
      complete_function_calls = true,
      include_completions_with_insert_text = true,
      publish_diagnostic_on = 'insert_leave',
      tsserver_plugins = {
        'typescript-plugin-css-modules',
      },
      tsserver_format_options = {
        allowTextChangesInNewFiles = true,
      },
    },
  },
}
