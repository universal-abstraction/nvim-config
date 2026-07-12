-- plugins/lang-autoswitch.lua
--
-- Input layout autoswitch (Sway backend)

return {
	"universal-abstraction/lang-autoswitch.nvim",
	event = { "VimEnter", "InsertEnter", "InsertLeave", "FocusGained", "FocusLost" },
	config = function()
		require("lang_autoswitch").setup({
			backend = {
				name = "sway",
				default_layout = "English (US)",
				device = "1:1:AT_Translated_Set_2_keyboard",
				layouts = { "English (US)", "Russian" },
			},
			restore_on_insert = true,
			set_on_focus_gained = true,
			restore_on_focus_lost = true,
			-- debug = true,
			-- debug_path = "/tmp/lang-autoswitch.log",
		})
	end,
}
