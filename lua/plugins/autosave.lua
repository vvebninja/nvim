return {
  "okuuva/auto-save.nvim",
  opts = {
    trigger_events = {
      immediate_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" },
      defer_save = { "TextChanged", "TextChangedI" },
    },
    debounce_delay = 1000,
    write_all_buffers = true,
    message = {
      enabled = false,
    },
  },
}
