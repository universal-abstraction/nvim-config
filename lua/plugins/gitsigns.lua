-- plugins/gitsigns.lua
--
-- Git integration with signs, blame, and hunk operations
-- Keybindings: lua/keybindings/git.lua

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },

  opts = {
    signs = {
      add = { text = "│" },
      change = { text = "│" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    current_line_blame = false,

    on_attach = function(bufnr)
      require("keybindings.git").setup(bufnr)
    end,
  },
}
