-- plugins/lang-autoswitch.lua
--
-- Input layout autoswitch (Hyprland backend)

return {
	"universal-abstraction/lang-autoswitch.nvim",
	event = { "VimEnter", "InsertEnter", "InsertLeave", "FocusGained", "FocusLost" },
	config = function()
		require("lang_autoswitch").setup({
			default_layout = "us",
			restore_on_insert = true,
			set_on_focus_gained = true,
			restore_on_focus_lost = true,
			device = "at-translated-set-2-keyboard",
			layouts = { "us", "ru" },
			--debug = true,
			--debug_path = "/tmp/lang-autoswitch.log",
		})
	end,
}
