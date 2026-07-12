-- keybindings/core.lua
--
-- Core editor keybindings (not plugin-specific)

local map = vim.keymap.set

-- Quit/session
map("n", "<leader>qq", ":q<CR>", { desc = "Quit" })

-- Plugin management
map("n", "<leader>pl", ":Lazy<cr>", { desc = "Open Lazy" })
map("n", "<leader>pm", ":Mason<cr>", { desc = "Open Mason" })

-- Python
map("n", "<leader>vs", "<cmd>VenvSelect<cr>", { desc = "Select Python venv" })

-- Diagnostics and health/debug info
map("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })
map("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Previous diagnostic" })
map("n", "<leader>xd", vim.diagnostic.open_float, { desc = "Line diagnostic" })
map("n", "<leader>li", "<cmd>checkhealth vim.lsp<CR>", { desc = "LSP health" })
map("n", "<leader>ci", "<cmd>ConformInfo<cr>", { desc = "Conform info" })
