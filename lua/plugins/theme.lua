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
				["@tag.attribute.tsx"] = { fg = c.blue5, italic = false },
				["@tag.attribute.javascript"] = { fg = c.blue5, italic = false },

				-- Variables: className
				["@variable.tsx"] = { fg = c.purple, italic = false },
				["@variable.javascript"] = { fg = c.purple, italic = false },

				-- Function parameter: className, onClick
				["@variable.parameter.tsx"] = { fg = c.magenta, italic = false },
				["@variable.parameter.javascript"] = { fg = c.magenta, italic = false },

				-- Punctuation bracket: {}, []
				["@punctuation.bracket.tsx"] = { fg = c.purple, italic = false },
				["@punctuation.bracket.javascript"] = { fg = c.purple, italic = false },
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
