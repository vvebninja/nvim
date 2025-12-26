return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night",
    on_highlights = function(hl, c)
      local jsx_hl = {
        -- Standard tags: <div>, <span>
        ["@tag.builtin.tsx"] = { fg = c.blue },
        ["@tag.builtin.javascript"] = { fg = c.blue },

        ["@markup.heading.1.tsx"] = { fg = c.white },

        -- Custom Components: <MyComponent />
        ["@tag.tsx"] = { fg = c.blue, bold = true },
        ["@tag.javascript"] = { fg = c.blue, bold = true },

        -- Brackets: <, >, </, />
        ["@tag.delimiter.tsx"] = { fg = c.blue },
        ["@tag.delimiter.javascript"] = { fg = c.blue },
        -- Attributes: className, onClick
        ["@tag.attribute.tsx"] = { fg = c.blue, italic = false },
        ["@tag.attribute.javascript"] = { fg = c.blue5, italic = false },
        ["@lsp.typemod.method.defaultLibrary.typescriptreact"] = { fg = c.blue, italic = false },
        ["@lsp.type.method.typescriptreact"] = { fg = c.blue, italic = false },

        -- Keyword conditional: if/else
        ["@keyword.conditional.tsx"] = { fg = c.blue5, italic = false },

        -- Variables: var name
        ["@variable.tsx"] = { fg = c.purple, italic = false },
        ["@lsp.type.variable"] = { fg = c.purple, italic = false },
        ["@lsp.mod.declaration.typescript"] = { fg = c.purple, italic = false },
        ["@variable.javascript"] = { fg = c.purple, italic = false },

        -- Function parameter:
        ["@variable.parameter.tsx"] = { fg = c.magenta, italic = false },
        ["@variable.parameter.javascript"] = { fg = c.magenta, italic = false },

        -- Punctuation bracket: {}, []
        ["@punctuation.bracket.tsx"] = { fg = c.purple, italic = false },
        ["@punctuation.bracket.javascript"] = { fg = c.purple, italic = false },

        -- Markup heading: h1/h6
        ["@markup.heading.1.tsx"] = { fg = c.white, italic = false },
        ["@markup.heading.2.tsx"] = { fg = c.white, italic = false },
        ["@markup.heading.3.tsx"] = { fg = c.white, italic = false },
        ["@markup.heading.4.tsx"] = { fg = c.white, italic = false },
        ["@markup.heading.5.tsx"] = { fg = c.white, italic = false },
        ["@markup.heading.6.tsx"] = { fg = c.white, italic = false },
        ["@lsp.type.parameter.typescriptreact"] = { fg = c.hint },
      }

      for group, settings in pairs(jsx_hl) do
        hl[group] = settings
      end
    end,
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd.colorscheme("tokyonight-night")
  end,
}
