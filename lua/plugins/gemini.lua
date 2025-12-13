return {
  'meinside/gmn.nvim',
  config = function()
    require('gmn').setup({
      -- You might put your config file path here if it's different
      -- configFilepath = vim.fn.expand('~/.config/gmn.nvim/config.json'),
      model = 'gemini-2.5-flash', -- Or 'gemini-1.5-flash', etc. check Gemini docs for available models
    })
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- If it also uses telescope for selection, you might add:
    -- 'nvim-telescope/telescope.nvim',
  },
}
