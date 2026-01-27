return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		style = "night",
		on_colors = function(colors)
			colors.bg_v = "#1E1E2E"
			colors.bg = "#13161a"
			colors.bg_dark = "#0f1115"
			colors.bg_float = "#0f1115"
			colors.bg_sidebar = "#0f1115"
			colors.bg_statusline = "#0d0f12"

			colors.blue = "#7aa2f7"
			colors.magenta = "#bb9af7"
			colors.orange = "#ff9e64"
			colors.yellow = "#e0af68"
			colors.toxic_green = "#4ec9b0"
		end,

		on_highlights = function(hl, c)
			local jsx_hl = {
				-- ["@property"] = { fg = c.green1 },
				["typescriptObjectLabel"] = { fg = c.green1 },
				["typescriptCall"] = { fg = c.blue },
				["typescriptNull"] = { fg = c.yellow },
				["typescriptBlock"] = { fg = c.magenta },
				["typescriptUnion"] = { fg = c.fg_sidebar },
				["typescriptBoolan"] = { fg = c.yellow },
				["typescriptImport"] = { fg = c.blue2 },
				["typescriptExport"] = { fg = c.purple },
				["typescriptParens"] = { fg = c.blue },
				["typescriptParenExp"] = { fg = c.magenta },
				["typescriptBinaryOp"] = { fg = c.fg_sidebar },
				["typescriptVariable"] = { fg = c.purple },
				["typescriptArrowFunc"] = { fg = c.fg_sidebar },
				["typescriptTypeBlock"] = { fg = c.fg_sidebar },
				["typescriptDOMDocProp"] = { fg = c.fg_sidebar },
				["typescriptObjectType"] = { fg = c.blue2 },
				["typescriptDOMFormProp"] = { fg = c.fg_sidebar },
				["typescriptDOMNodeProp"] = { fg = c.fg_sidebar },
				["typescriptFuncCallArg"] = { fg = c.magenta },
				["typescriptTypeBracket"] = { fg = c.blue2 },
				["typescriptConditional"] = { fg = c.purple },
				["typescriptAliasKeyword"] = { fg = c.blue2 },
				["typescriptObjectMember"] = { fg = c.blue2 },
				["typescriptFuncTypeArrow"] = { fg = c.fg_sidebar },
				["typescriptIdentifierName"] = { fg = c.magenta },
				["typescriptBOMHistoryProp"] = { fg = c.fg_sidebar },
				["typescriptObjectLiteral"] = { fg = c.magenta },
				["typescriptInterfaceKeyword"] = { fg = c.blue2 },
				["typescriptConditionalParen"] = { fg = c.magenta },
				["typescriptArrayDestructure"] = { fg = c.magenta },
				["typescriptAsyncFuncKeyword"] = { fg = c.cyan },
				["typescriptDefaultImportName"] = { fg = c.fg_sidebar },
				["typescriptDestructureVariable"] = { fg = c.magenta },
				["typescriptVariableDeclaration"] = { fg = c.magenta },
				["typescriptComputedPropertyName"] = { fg = c.fg_sidebar },
				["typescriptPaymentShippingOptionProp"] = { fg = c.fg_sidebar },

				["tsxTag"] = { fg = c.fg_gutter },
				["tsxEscJs"] = { fg = c.magenta },
				-- ["tsxString"] = { fg = "#aff1bc" } classNames values,
				["tsxAttrib"] = { fg = c.yellow },
				["tsxRegion"] = { fg = c.green },
				["tsxTagName"] = { fg = "#4ec9b0" },
				["tsxCloseTag"] = { fg = c.fg_gutter },
				["tsxEscapeJs"] = { fg = c.fg_sidebar },
				["tsxFragment"] = { fg = c.red },
				["tsxCloseString"] = { fg = c.fg_gutter },
				["tsxIntrinsicTagName"] = { fg = c.red },

				["Keyword"] = { fg = c.blue },

				["@lsp.typemod.member.async.typescriptreact"] = { fg = c.blue },
			}

			local neo_tree_hl = {
				NeoTreeNormal = { bg = c.bg_sidebar, fg = "#a9b1d6" },
				NeoTreeNormalNC = { bg = c.bg_sidebar },
				NeoTreeRootName = { fg = c.magenta, bold = true, italic = true },
				NeoTreeGitAdded = { fg = c.green },
				NeoTreeCursorLine = { bg = "#1e222a" },
				NeoTreeGitModified = { fg = c.orange },
				NeoTreeGitUntracked = { fg = c.cyan },
				NeoTreeDirectoryIcon = { fg = "#28313b" },
				NeoTreeDirectoryName = { fg = c.cyan },

				WinSeparator = { fg = "#1b1e23", bg = c.bg },
			}

			for group, settings in pairs(jsx_hl) do
				hl[group] = settings
			end

			for group, settings in pairs(neo_tree_hl) do
				hl[group] = settings
			end

			hl.Visual = { bg = "#28313a" }
			hl.FloatBorder = { fg = "#2a2e36", bg = "#0f1115" }
		end,
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd.colorscheme("tokyonight")
	end,
}
