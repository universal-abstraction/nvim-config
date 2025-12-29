-- project.lua
--
-- Configuration for project management.
-- This file sets up project-specific settings and integrates with Telescope.

return {
  "ahmedkhalf/project.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  event = "VeryLazy",  -- Must load after telescope

  -- Plugin options
  opts = {
    -- Automatically detect project root
    detection_methods = { "lsp", "pattern" },
    patterns = {
      ".git",
      "Cargo.toml",
      "pyproject.toml",
      "Makefile",
      "package.json",
      "compile_commands.json",
    },
    silent_chdir = true,
    manual_mode = false,
  },

  -- Setup and integration
  config = function(_, opts)
    -- Project setup
    require("project_nvim").setup(opts)

    -- Integrate with Telescope
    require("telescope").load_extension("projects")
  end,
}
