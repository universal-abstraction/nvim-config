-- plugins/neo-tree.lua
--
-- Project tree for browsing unfamiliar repositories.

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	cmd = "Neotree",
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle explorer" },
		{ "<leader>E", "<cmd>Neotree reveal<CR>", desc = "Reveal current file" },
	},
	opts = {
		close_if_last_window = true,
		enable_diagnostics = true,
		enable_git_status = true,
		filesystem = {
			follow_current_file = {
				enabled = true,
			},
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = true,
			},
			use_libuv_file_watcher = true,
		},
		window = {
			width = 34,
		},
	},
}
