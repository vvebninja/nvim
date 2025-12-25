-- lua/plugins/linting.lua
return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- 🎯 Low Coupling: Define linters by filetype
		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			markdown = { "markdownlint" },
		}

		-- 🏗️ High Cohesion: Centralized lint trigger logic
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				-- Only run lint if the current file has a linter configured
				if lint.linters_by_ft[vim.bo.filetype] then
					lint.try_lint()
				end
			end,
		})

		-- Optional: Pro keymap to manually trigger linting
		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
