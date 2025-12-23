return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		style = "night",
		on_highlights = function(hl, c)
			-- 1. Create a clear highlight palette for JSX
			local jsx_hl = {
				-- Standard tags: <div>, <span>
				["@tag.builtin.tsx"] = { fg = c.red },
				["@tag.builtin.javascript"] = { fg = c.red },

				-- Custom Components: <MyComponent />
				["@tag.tsx"] = { fg = c.red, bold = true },
				["@tag.javascript"] = { fg = c.red, bold = true },

				-- Brackets: <, >, </, />
				["@tag.delimiter.tsx"] = { fg = c.blue5 },
				["@tag.delimiter.javascript"] = { fg = c.blue5 },

				-- Attributes: className, onClick
				["@tag.attribute.tsx"] = { fg = c.cyan, italic = false },
				["@tag.attribute.javascript"] = { fg = c.cyan, italic = false },

				["@variable.tsx"] = { fg = c.magenta, italic = false },
				["@variable.javascript"] = { fg = c.magenta, italic = false },

				["@punctuation.bracket.tsx"] = { fg = c.magenta, italic = false },
				["@punctuation.bracket.javascript"] = { fg = c.magenta, italic = false },
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
