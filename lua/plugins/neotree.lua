return {
  {
    "folke/edgy.nvim",
    optional = true,
    opts = function(_, opts)
      for _, section in ipairs(opts.left or {}) do
        if section.ft == "neo-tree" then
          section.size = { width = 55 }
        end
      end
    end,
  },
}
