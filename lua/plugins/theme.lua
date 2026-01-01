return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night",
    on_highlights = function(hl, c)
      local jsx_hl = {
        ["typescriptTypeBracket"] = { fg = c.blue2, italic = false },
        ["typescriptCall"] = { fg = c.blue, italic = false },
        ["typescriptExport"] = { fg = c.purple, italic = false },
        ["typescriptParens"] = { fg = c.blue, italic = false },

        ["typescriptStatementKeyword"] = { fg = c.red, italic = false },
        ["typescriptImport"] = { fg = c.blue2, italic = false },
        ["typescriptDefaultImportName"] = { fg = c.fg_sidebar, italic = false },
        ["typescriptBlock"] = { fg = c.fg_sidebar, italic = false },
        ["typescriptUnion"] = { fg = c.fg_sidebar, italic = false },
        ["typescriptArrowFunc"] = { fg = c.fg_sidebar, italic = false },
        ["typescriptFuncTypeArrow"] = { fg = c.fg_sidebar, italic = false },
        ["typescriptTypeBlock"] = { fg = c.fg_sidebar, italic = false },
        ["typescriptIdentifierName"] = { fg = c.fg_sidebar, italic = false },
        ["@lsp.type.parameter.typescriptreact"] = { fg = c.fg_sidebar, italic = false },

        ["tsxRegion"] = { fg = c.fg_sidebar, italic = false },
        ["typescriptBinaryOp"] = { fg = c.fg_sidebar, italic = false },
        ["@lsp.type.property.typescriptreact"] = { fg = c.fg_sidebar, italic = false },
        ["typescriptBOMHistoryProp"] = { fg = c.fg_sidebar, italic = false },
        ["typescriptDOMFormProp"] = { fg = c.fg_sidebar, italic = false },
        ["typescriptDOMNodeProp"] = { fg = c.fg_sidebar, italic = false },
        ["typescriptDOMDocProp"] = { fg = c.fg_sidebar, italic = false },
        ["typescriptFuncCallArg"] = { fg = c.fg_sidebar, italic = false },
        ["@lsp.typemod.property.defaultLibrary.typescriptreact"] = { fg = c.fg_sidebar, italic = false },
        ["@lsp.mod.defaultLibrary.typescriptreact"] = { fg = c.fg_sidebar, italic = false },
        ["typescriptPaymentShippingOptionProp"] = { fg = c.fg_sidebar, italic = false },
        ["tsxEscJs"] = { fg = c.fg_sidebar, italic = false },
        ["tsxEscapeJs"] = { fg = c.fg_sidebar, italic = false },
        ["typescriptComputedPropertyName"] = { fg = c.fg_sidebar, italic = false },

        -- 🍎 HTML / INTRINSIC (Red)
        ["@tag.builtin"] = { fg = c.red },
        ["tsxIntrinsicTagName"] = { fg = c.red },
        ["tsxFragment"] = { fg = c.red },
        ["@tag.delimiter"] = { fg = c.red }, -- Default brackets to Red (HTML fallback)
        ["tsxCloseTag"] = { fg = c.red },
        ["tsxCloseString"] = { fg = c.red },

        -- 💙 COMPONENTS (teal)
        ["@tag"] = { fg = c.blue }, -- The Component Name (Bold for pop)
        ["tsxTagName"] = { fg = c.blue },
        ["tsxTag"] = { fg = c.red }, -- Opening tag container
        ["tsxCloseString"] = { fg = c.blue },
        ["@tag.delimiter.tsx"] = { fg = c.blue }, -- Brackets for components
        ["@tag.tsx"] = { fg = c.blue },
        ["@punctuation.special.tsx"] = { fg = c.blue },

        -- 💎 VARIABLES & PARAMS (The "Hint" Teal)
        ["@variable"] = { fg = c.purple },
        ["@variable.builtin"] = { fg = c.hint },
        ["@variable.parameter"] = { fg = c.magenta }, -- Kept magenta to separate logic from data
        ["@variable.member"] = { fg = c.blue1 }, -- Object properties

        ["typescriptProp"] = { fg = c.error }, -- 'const', 'let', 'var'
        ["tsxEscJs"] = { fg = c.grey }, -- 'const', 'let', 'var'
        -- 🔑 KEYWORDS (Purple)
        ["@keyword"] = { fg = c.purple, italic = false },
        ["typescriptVariable"] = { fg = c.purple }, -- 'const', 'let', 'var'

        -- 🧪 ATTRIBUTES (Orange)
        ["tsxAttrib"] = { fg = c.yellow },
        ["@tag.attribute"] = { fg = c.yellow },

        -- 📍 PUNCTUATION & SYMBOLS
        ["@punctuation.bracket"] = { fg = c.purple }, -- { } [ ] ( )
        ["@punctuation.delimiter"] = { fg = c.fg_gutter }, -- , .

        -- 🛡️ LSP & LANGUAGE SYNC (Low Coupling)
        -- We link these so we don't have to define colors twice
        ["@lsp.type.variable"] = { link = "@variable" },
        ["@lsp.type.parameter"] = { link = "@variable.parameter" },
        ["@lsp.type.property"] = { link = "@variable.member" },
        ["@lsp.type.tag"] = { link = "@tag" },
        ["@variable.javascript"] = { link = "@variable" },
        ["@variable.tsx"] = { link = "@variable" },
        ["@punctuation.bracket.tsx"] = { link = "@punctuation.bracket" },

        -- ... (keep your previous Tag and Variable logic here)

        -- 🔵 FUNCTIONS & METHODS (The "Action" Blue)
        ["@function"] = { fg = c.blue },
        ["@function.builtin"] = { fg = c.blue },
        ["@function.call"] = { fg = c.blue },
        ["@method"] = { fg = c.blue },
        ["@method.call"] = { fg = c.blue },

        -- 🛡️ LSP SYNC: Link LSP tokens to the Tree-sitter source
        -- This is Low Coupling: change @function, and the LSP follows automatically.
        ["@lsp.type.function"] = { link = "@function" },
        ["@lsp.type.method"] = { link = "@method" },

        -- Special case for TSX/React methods (like array.map, etc.)
        ["typescriptArrayMethod"] = { link = "@method" },
        ["@lsp.typemod.method.defaultLibrary.typescriptreact"] = { link = "@method" },

        ["@tag.html.red"] = { fg = c.red },
        ["@punctuation.bracket.tag.red"] = { fg = c.red },
        ["@constructor.teal"] = { fg = c.hint },
        ["@punctuation.bracket.tag.teal"] = { fg = c.hint },
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
