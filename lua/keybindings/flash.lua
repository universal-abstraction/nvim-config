-- keybindings/flash.lua
--
-- Fast navigation with flash.nvim

local M = {}

function M.setup()
  local flash = require("flash")

  vim.keymap.set({ "n", "x", "o" }, "s", flash.jump, { desc = "Flash jump" })
  vim.keymap.set({ "n", "x", "o" }, "S", flash.treesitter, { desc = "Flash treesitter" })
  vim.keymap.set("o", "r", flash.remote, { desc = "Remote flash" })
  vim.keymap.set({ "o", "x" }, "R", flash.treesitter_search, { desc = "Treesitter search" })
  vim.keymap.set("c", "<C-s>", flash.toggle, { desc = "Toggle flash search" })
end

return M
