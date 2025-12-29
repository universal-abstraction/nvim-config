-- keybindings/core.lua
--
-- Core editor keybindings (not plugin-specific)
-- Russian layout handled by langmapper.nvim

local map = vim.keymap.set

-- File operations
map("n", "<leader>ww", ":w<cr>", { desc = "Save" })
map("n", "<leader>qq", ":q<CR>", { desc = "Close" })
map("n", "<leader>wq", ":wq<CR>", { desc = "Save & Close" })

-- Plugin management
map("n", "<leader>pl", ":Lazy<cr>", { desc = "Open Lazy" })

-- Python
map("n", "<leader>vs", "<cmd>VenvSelect<cr>", { desc = "Select Python venv" })
