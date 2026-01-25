return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		style = "night",
		on_highlights = function(hl, c)
			local ts = "typescript"
			local jsx_hl = {

				["@lsp.type.member.typescriptreact"] = { fg = c.blue },
				-- object property
				["@lsp.type.property.typescriptreact"] = { fg = c.fg_sidebar },

				["@lsp.typemod.property.declaration.typescriptreact"] = { fg = c.blue2 },
				["typescriptTypeBracket"] = { fg = c.blue2 },
				["typescriptAliasKeyword"] = { fg = c.blue2 },
				["typescriptObjectType"] = { fg = c.blue2 },
				["typescriptObjectMember"] = { fg = c.blue2 },
				["typescriptInterfaceKeyword"] = { fg = c.blue2 },
				["typescriptCall"] = { fg = c.blue },
				["typescriptExport"] = { fg = c.purple },
				["typescriptConditional"] = { fg = c.purple },
				["typescriptParens"] = { fg = c.blue },

				["typescriptStatementKeyword"] = { fg = c.purple },
				["typescriptNull"] = { fg = c.yellow },
				["typescriptBoolan"] = { fg = c.yellow },

				["typescriptImport"] = { fg = c.blue2 },
				["typescriptDefaultImportName"] = { fg = c.fg_sidebar },
				["typescriptBlock"] = { fg = c.fg_sidebar },
				["typescriptUnion"] = { fg = c.fg_sidebar },
				["typescriptArrowFunc"] = { fg = c.fg_sidebar },
				["typescriptFuncTypeArrow"] = { fg = c.fg_sidebar },
				["typescriptTypeBlock"] = { fg = c.fg_sidebar },
				["typescriptIdentifierName"] = { fg = c.fg_sidebar },
				["@lsp.type.parameter.typescriptreact"] = { fg = c.purple },

				["tsxRegion"] = { fg = c.fg_sidebar },
				["typescriptBinaryOp"] = { fg = c.fg_sidebar },
				["typescriptBOMHistoryProp"] = { fg = c.fg_sidebar },
				["typescriptBOMNavigatiorProp"] = { fg = c.red },
				["typescriptDOMFormProp"] = { fg = c.fg_sidebar },
				["typescriptDOMNodeProp"] = { fg = c.fg_sidebar },
				["typescriptDOMDocProp"] = { fg = c.fg_sidebar },
				["typescriptFuncCallArg"] = { fg = c.fg_sidebar },
				["@lsp.typemod.property.defaultLibrary.typescriptreact"] = { fg = c.fg_sidebar },
				["@lsp.mod.defaultLibrary.typescriptreact"] = { fg = c.blue },
				["typescriptPaymentShippingOptionProp"] = { fg = c.fg_sidebar },
				["tsxEscJs"] = { fg = c.fg_sidebar },
				["tsxEscapeJs"] = { fg = c.fg_sidebar },
				["typescriptComputedPropertyName"] = { fg = c.fg_sidebar },

				-- 🍎 HTML / INTRINSIC (Red)
				["@tag.builtin"] = { fg = c.red },
				["tsxIntrinsicTagName"] = { fg = c.red },
				["tsxFragment"] = { fg = c.red },
				["@tag.delimiter"] = { fg = c.red }, -- Default brackets to Red (HTML fallback)
				["tsxCloseTag"] = { fg = c.fg_gutter },
				["tsxCloseString"] = { fg = c.fg_gutter },

				-- 💙 COMPONENTS
				["@tag"] = { fg = c.blue }, -- The Component Name (Bold for pop)
				["tsxTagName"] = { fg = c.orange, bold = true },
				["tsxTag"] = { fg = c.fg_gutter }, -- Opening tag container
				["@tag.delimiter.tsx"] = { fg = c.blue }, -- Brackets for components
				["@tag.tsx"] = { fg = c.blue },
				["@punctuation.special.tsx"] = { fg = c.blue },

				-- 💎 VARIABLES & PARAMS (The "Hint" Teal)
				["@variable"] = { fg = c.purple },
				["@variable.builtin"] = { fg = c.hint },
				["@variable.parameter"] = { fg = c.magenta }, -- Kept magenta to separate logic from data
				["@variable.member"] = { fg = c.blue1 }, -- Object properties

				-- ["typescriptProp"] = { fg = c.error }, -- 'const', 'let', 'var'
				["@keyword"] = { fg = c.purple },
				["typescriptVariable"] = { fg = c.cyan },
				["tsxAttrib"] = { fg = c.orange },
				["@tag.attribute"] = { fg = c.orange },

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
-- -- vscBack = '#1E1E2E',
-- ["tsxTagName"] = { fg = "#4ec9b0", bold = false },
-- ["tsxCloseString"] = { fg = "#808080" },
-- ["typescriptBlock"] = { fg = "#586e75" },
-- -- Если переменные base1 и cyan не определены выше в твоем файле,
-- -- лучше заменить их на HEX, иначе Neovim выдаст ошибку.
-- -- ['@tag.delimiter'] = { fg = '#839496' },
-- -- ['typescriptArrowFunc'] = { fg = '#00bcd4' },
