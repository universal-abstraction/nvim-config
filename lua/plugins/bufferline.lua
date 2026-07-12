-- plugins/bufferline.lua
--
-- Visual list of open buffers. Buffer switching remains buffer-based, not tabpage-based.

return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	opts = {
		options = {
			mode = "buffers",
			diagnostics = "nvim_lsp",
			separator_style = "thin",
			show_buffer_close_icons = false,
			show_close_icon = false,
			always_show_bufferline = false,
			offsets = {
				{
					filetype = "neo-tree",
					text = "Explorer",
					highlight = "Directory",
					text_align = "left",
				},
			},
		},
	},
}
