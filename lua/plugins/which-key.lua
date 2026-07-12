-- plugins/which-key.lua
--
-- Keybinding hints popup when pressing leader

return {
	"folke/which-key.nvim",
	event = "VeryLazy",

	opts = {
		delay = 200,
		icons = { mappings = false },
		spec = {
			{ "<leader>b", group = "Buffers" },
			{ "<leader>c", group = "Code" },
			{ "<leader>f", group = "Files" },
			{ "<leader>g", group = "Git" },
			{ "<leader>l", group = "LSP" },
			{ "<leader>p", group = "Plugins" },
			{ "<leader>q", group = "Quit" },
			{ "<leader>t", group = "Tests/terminal" },
			{ "<leader>v", group = "Virtual environment" },
			{ "<leader>w", group = "Windows" },
			{ "<leader>x", group = "Diagnostics" },
		},
	},
}
