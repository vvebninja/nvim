-- lua/plugins/statusline.lua
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		-- 🎨 High Cohesion: Define how diagnostics look in one place
		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn", "info", "hint" },
			symbols = { error = "󰅚 ", warn = "󰀪 ", info = "󰋽 ", hint = "󰌶 " },
			colored = true,
			update_in_insert = false,
			always_visible = false,
		}

		-- ⚙️ Low Coupling: Function to get active LSP name
		local lsp_status = function()
			local msg = "No Active LSP"
			local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
			local clients = vim.lsp.get_clients({ bufnr = 0 })
			if next(clients) == nil then
				return msg
			end
			for _, client in ipairs(clients) do
				local filetypes = client.config.filetypes
				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
					return client.name
				end
			end
			return msg
		end

		lualine.setup({
			options = {
				theme = "auto", -- Automatically matches your colorscheme
				component_separators = { left = "│", right = "│" },
				section_separators = { left = "", right = "" },
				globalstatus = true, -- Pro: One statusline for all splits
				disabled_filetypes = { statusline = { "dashboard", "alpha", "NvimTree" } },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = { { "filename", path = 1 } }, -- Path = 1 shows relative path (Pro for monorepos)
				lualine_x = {
					diagnostics,
					{ lsp_status, icon = " ", color = { fg = "#ffffff", gui = "bold" } },
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
