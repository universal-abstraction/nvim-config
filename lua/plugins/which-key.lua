-- plugins/which-key.lua
--
-- Keybinding hints popup when pressing leader

return {
  "folke/which-key.nvim",
  event = "VeryLazy",

  opts = {
    delay = 200,
    icons = { mappings = false },
    spec = {
      { "<leader>b", group = "buffer" },
      { "<leader>c", group = "code" },
      { "<leader>f", group = "find" },
      { "<leader>g", group = "git" },
      { "<leader>l", group = "lsp" },
      { "<leader>p", group = "plugins" },
      { "<leader>q", group = "quit" },
      { "<leader>v", group = "venv" },
      { "<leader>w", group = "write" },
    },
  },
}
