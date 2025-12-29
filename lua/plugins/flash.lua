-- plugins/flash.lua
--
-- Fast navigation with search labels
-- Keybindings: lua/keybindings/flash.lua

return {
  "folke/flash.nvim",
  event = "VeryLazy",

  opts = {
    modes = {
      char = {
        jump_labels = true,  -- Show labels for f, F, t, T
      },
    },
  },

  config = function(_, opts)
    require("flash").setup(opts)
    require("keybindings.flash").setup()
  end,
}
