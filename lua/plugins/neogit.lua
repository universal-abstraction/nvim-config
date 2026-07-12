-- plugins/neogit.lua
--
-- Full Git UI. Gitsigns remains responsible for inline hunk operations.

return {
	"NeogitOrg/neogit",
	cmd = "Neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		{ "<leader>gg", "<cmd>Neogit<CR>", desc = "Git status" },
		{ "<leader>gl", "<cmd>NeogitLog<CR>", desc = "Git log" },
	},
	opts = {
		integrations = {
			diffview = true,
			telescope = true,
		},
	},
}
