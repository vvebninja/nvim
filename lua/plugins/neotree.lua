return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"mrbjarksen/neo-tree-diagnostics.nvim",
		"echasnovski/mini.icons",
		"nvim-tree/nvim-web-devicons",
		"ryanoasis/vim-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	opts = {
		filesystem = {
			hijack_netrw_behavior = "disabled",
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = true,
			},
			reveal = {
				enable = true,
				reveal_for_dirs = true,
				auto_expand_all = false,
				focus_on_startup = true,
				force_cwd = false,
			},
		},
		event_handlers = {
			{
				event = "neo_tree_buffer_enter",
				handler = function()
					vim.opt_local.number = true
					vim.opt_local.relativenumber = true
				end,
			},
			{
				event = "neo_tree_buffer_leave",
				handler = function()
					vim.opt_local.number = vim.o.number
					vim.opt_local.relativenumber = vim.o.relativenumber
				end,
			},
		},
		enable_git_status = false,
		enable_diagnostics = true,
		window = {
			position = "right", -- Ensures consistent opening position
			width = 35, -- Your adjusted width
		},
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)

		vim.keymap.set("n", "<leader>e", function()
			local neo_tree_manager_ok, neo_tree_manager = pcall(require, "neo-tree.sources.manager")

			if neo_tree_manager_ok and neo_tree_manager and type(neo_tree_manager.is_opened) == "function" then
				if neo_tree_manager.is_opened("filesystem") then
					-- If Neo-tree is currently open, close it (toggle behavior)
					vim.cmd("Neotree close")
				else
					-- If Neo-tree is closed, open it and reveal the current file.
					-- 'reveal_force_cwd' handles opening at the correct root.
					vim.cmd("Neotree reveal_force_cwd left")
				end
			else
				-- Fallback: If manager isn't available (e.g., during very early startup),
				-- attempt to open and reveal anyway. It might fail, but it's the best effort.
				vim.cmd("Neotree reveal_force_cwd left")
			end
		end, { desc = "Neo-tree File Explorer (Toggle & Reveal Current)" })

		-- START: Robust Auto-Reveal Logic (from our previous successful solution)
		local neo_tree_reveal_augroup = vim.api.nvim_create_augroup("NeoTreeRevealGroup", { clear = true })

		local function reveal_current_file_in_neotree()
			local current_win = vim.api.nvim_get_current_win()
			local current_buf = vim.api.nvim_win_get_buf(current_win)

			-- Check if the current buffer is a normal file and not a special buffer
			local buftype = vim.api.nvim_buf_get_option(current_buf, "buftype")
			local bufname = vim.api.nvim_buf_get_name(current_buf)
			local filetype = vim.api.nvim_buf_get_option(current_buf, "filetype")

			-- Ignore special buffers (e.g., Telescope, help, terminals, or Neo-tree itself)
			local ignored_filetypes = {
				"TelescopePrompt",
				"TelescopeResults",
				"help",
				"man",
				"startify",
				"neogitstatus",
				"terminal",
				"quickfix",
				"lspinfo",
				"checkhealth",
				"neo-tree", -- Exclude Neo-tree's own buffer
				"neo-tree-buffer", -- Exclude Neo-tree's own buffer
			}

			-- If it's not a normal file buffer OR has no name OR its filetype is in our ignored list, return early
			if buftype ~= "" or bufname == "" or vim.tbl_contains(ignored_filetypes, filetype) then
				return
			end

			-- Safely attempt to require the neo-tree manager module
			local neo_tree_manager_ok, neo_tree_manager = pcall(require, "neo-tree.sources.manager")

			-- Proceed only if the module was loaded successfully and its 'is_opened' function exists
			if neo_tree_manager_ok and neo_tree_manager and type(neo_tree_manager.is_opened) == "function" then
				-- Check if Neo-tree's 'filesystem' source is currently open/visible
				if neo_tree_manager.is_opened("filesystem") then
					-- Delay the execution of Neotree reveal_current
					vim.defer_fn(function()
						-- Re-check conditions again after the delay, as context might have changed
						if
							vim.api.nvim_win_is_valid(current_win)
							and vim.api.nvim_win_get_buf(current_win) == current_buf -- Ensure it's still the same buffer
							and neo_tree_manager.is_opened("filesystem")
						then
							vim.cmd("Neotree reveal_current")
						end
					end, 50) -- 50 milliseconds delay
				end
			end
		end

		-- Trigger the reveal function whenever a buffer is entered (e.g., opening from Telescope)
		vim.api.nvim_create_autocmd("BufEnter", {
			group = neo_tree_reveal_augroup,
			callback = reveal_current_file_in_neotree,
			pattern = "*",
		})

		-- Also trigger the reveal function when switching between windows (e.g., using <C-w>h/<C-w>l)
		vim.api.nvim_create_autocmd("WinEnter", {
			group = neo_tree_reveal_augroup,
			callback = reveal_current_file_in_neotree,
			pattern = "*",
		})

		vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
		vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
	end,
}
