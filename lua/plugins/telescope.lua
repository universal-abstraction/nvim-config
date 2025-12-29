-- telescope.lua
--
-- Configuration for Telescope, a fuzzy finder.
-- This file sets up keybindings and default options for Telescope.

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",  -- Load early so keybindings work

  -- Plugin options
  opts = {},

  -- Setup
  config = function(_, opts)
    require("telescope").setup(opts)
  end,
}