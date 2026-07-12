-- project.lua
--
-- Configuration for project management.
-- This file sets up project-specific settings and integrates with Telescope.

return {
	"DrKJeff16/project.nvim", -- Maintained fork (original is abandoned)
	dependencies = { "nvim-telescope/telescope.nvim" },
	event = "VeryLazy", -- Must load after telescope

	opts = {
		lsp = { enabled = true }, -- Use LSP for project detection
		patterns = {
			".git",
			"Cargo.toml",
			"pyproject.toml",
			"Makefile",
			"package.json",
			"compile_commands.json",
		},
		silent_chdir = false,
		manual_mode = true,
	},

	-- Setup and integration
	config = function(_, opts)
		require("project").setup(opts)
		require("telescope").load_extension("projects")
	end,
}
