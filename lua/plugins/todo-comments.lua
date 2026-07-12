-- plugins/todo-comments.lua
--
-- Highlight and collect TODO/FIXME/HACK/WARN/PERF/NOTE comments.

return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = { "BufReadPost", "BufNewFile" },
	keys = {
		{
			"]t",
			function()
				require("todo-comments").jump_next()
			end,
			desc = "Next TODO",
		},
		{
			"[t",
			function()
				require("todo-comments").jump_prev()
			end,
			desc = "Previous TODO",
		},
		{ "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "TODOs" },
	},
	opts = {},
}
