-- theme.lua
--
-- Configuration for the colorscheme.
-- This file sets up the Tokyonight theme.

return {
  "folke/tokyonight.nvim",
  lazy = false, -- load during startup
  priority = 1000, -- load before other plugins

  -- Theme options
  opts = {
    style = "night", -- available: "storm", "moon", "night", "day"
    transparent = false,
  },

  -- Setup and activation
  config = function(_, opts)
    -- Theme setup
    require("tokyonight").setup(opts)

    -- Set the colorscheme
    vim.cmd.colorscheme("tokyonight")
  end,
}