return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'mrbjarksen/neo-tree-diagnostics.nvim',
    -- 'echasnovski/mini.icons',
    'nvim-tree/nvim-web-devicons',
    -- 'ryanoasis/vim-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { ',e', ':Neotree reveal<CR>', desc = 'NeoTree force_reveal_cwd', silent = true },
  },
  opts = {
    filesystem = {

      window = {
        mappings = {
          [',e'] = 'close_window',
        },
      },
      hijack_netrw_behavior = 'disabled',
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      reveal = {
        enable = true,
        reveal_for_dirs = true,
        auto_expand_all = false,
        focus_on_startup = true,
        force_cwd = false,
      },
    },
    event_handlers = {
      {
        event = 'neo_tree_buffer_enter',
        handler = function()
          vim.opt_local.number = true
          vim.opt_local.relativenumber = true
          -- vim.cmd 'setlocal winhighlight=Normal:NeoTreeNormal,NormalNC:NeoTreeNormalNC,LineNr:NeoTreeLineNr,CursorLineNr:NeoTreeCursorLineNr,SignColumn:NeoTreeNormal,CursorColumn:NeoTreeNormal,CursorLine:NeoTreeCursorLine'
        end,
      },
      {
        event = 'neo_tree_buffer_leave',
        handler = function()
          vim.opt_local.number = vim.o.number
          vim.opt_local.relativenumber = vim.o.relativenumber
        end,
      },
    },
    enable_git_status = true,
    enable_diagnostics = true,
    window = {
      position = 'left', -- Ensures consistent opening position
      width = 35, -- Your adjusted width
    },
  },
}
