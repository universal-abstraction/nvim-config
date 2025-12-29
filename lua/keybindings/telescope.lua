-- keybindings/telescope.lua
--
-- Telescope and project.nvim keybindings
-- Russian layout handled by langmapper.nvim

local map = vim.keymap.set

-- File finding
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find file" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find text" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffer" })

-- Project management
map("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "Find project" })
