-- keybindings/format.lua
--
-- Code formatting with conform.nvim

local M = {}

function M.setup()
  vim.keymap.set({ "n", "v" }, "<leader>cf", function()
    require("conform").format({ async = true, lsp_format = "fallback" })
  end, { desc = "Format buffer" })
end

return M
