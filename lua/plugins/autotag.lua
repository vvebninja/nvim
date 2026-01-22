return {
  {
    'windwp/nvim-ts-autotag',
    event = { 'BufReadPre', 'BufNewFile' }, -- Load as soon as you open a file
    opts = {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = true,
      },
      -- This ensures it triggers for the specific languages you use
      per_filetype = {
        ['typescriptreact'] = { enable_rename = true },
        ['javascriptreact'] = { enable_rename = true },
        ['html'] = { enable_rename = true },
      },
    },
  },
}
