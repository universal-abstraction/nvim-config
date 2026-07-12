-- plugins/trouble.lua
--
-- Diagnostics, references, quickfix, and location list views.

return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	keys = {
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics" },
		{ "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer diagnostics" },
		{ "<leader>xr", "<cmd>Trouble lsp_references toggle<CR>", desc = "References" },
		{ "<leader>xq", "<cmd>Trouble qflist toggle<CR>", desc = "Quickfix list" },
	},
	opts = {},
}
