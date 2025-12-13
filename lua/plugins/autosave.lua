return {
	"okuuva/auto-save.nvim",
	-- event = { "InsertLeave", "TextChanged" }, -- Events to load the plugin
	opts = {
		trigger_events = {
			immediate_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" },
			defer_save = { "TextChanged", "TextChangedI" },
		},
		debounce_delay = 3000,
		write_all_buffers = true,
		message = {
			enabled = false,
		},
	},
}
