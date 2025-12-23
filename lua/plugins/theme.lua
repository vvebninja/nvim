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
				["@tag.builtin.tsx"] = { fg = c.cyan },
				["@tag.builtin.javascript"] = { fg = c.cyan },

				["@markup.heading.1.tsx"] = { fg = c.white },

				-- Custom Components: <MyComponent />
				["@tag.tsx"] = { fg = c.blue, bold = true },
				["@tag.javascript"] = { fg = c.blue, bold = true },

				-- Brackets: <, >, </, />
				["@tag.delimiter.tsx"] = { fg = c.blue5 },
				["@tag.delimiter.javascript"] = { fg = c.blue5 },

				-- Attributes: className, onClick
				["@tag.attribute.tsx"] = { fg = c.yellow, italic = false },
				["@tag.attribute.javascript"] = { fg = c.yellow, italic = false },

				["@variable.tsx"] = { fg = c.magenta, italic = false },
				["@variable.javascript"] = { fg = c.magenta, italic = false },

				["@variable.parameter.tsx"] = { fg = c.magenta, italic = false },
				["@variable.parameter.javascript"] = { fg = c.magenta, italic = false },

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
