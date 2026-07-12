-- plugins/aerial.lua
--
-- Current file symbols outline.

return {
	"stevearc/aerial.nvim",
	branch = "nvim-0.11",
	cmd = { "AerialToggle", "AerialOpen", "AerialClose" },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader>cs", "<cmd>AerialToggle!<CR>", desc = "Symbols outline" },
	},
	opts = {
		backends = { "lsp", "treesitter", "markdown" },
		layout = {
			min_width = 30,
		},
		show_guides = true,
	},
}
