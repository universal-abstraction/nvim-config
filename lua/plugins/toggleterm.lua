-- plugins/toggleterm.lua
--
-- Reusable floating, horizontal, and vertical terminals.

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	cmd = "ToggleTerm",
	keys = {
		{ "<C-/>", "<cmd>ToggleTerm direction=float<CR>", mode = "n", desc = "Toggle terminal" },
		{ "<C-_>", "<cmd>ToggleTerm direction=float<CR>", mode = "n", desc = "Toggle terminal" },
		{ "<C-/>", "<C-\\><C-n><cmd>ToggleTerm direction=float<CR>", mode = "t", desc = "Toggle terminal" },
		{ "<C-_>", "<C-\\><C-n><cmd>ToggleTerm direction=float<CR>", mode = "t", desc = "Toggle terminal" },
		{ "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "Horizontal terminal" },
		{ "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", desc = "Vertical terminal" },
	},
	opts = {
		direction = "float",
		shade_terminals = false,
		float_opts = {
			border = "rounded",
		},
	},
}
