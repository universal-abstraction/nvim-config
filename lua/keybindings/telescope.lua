-- keybindings/telescope.lua
--
-- Telescope and project.nvim keybindings

local map_multilang = require("keybindings.utils").map_multilang

-- File finding
map_multilang("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find File" })
map_multilang("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find Text" })
map_multilang("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Open Buffers" })

-- Project management
map_multilang("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "Open Projects" })
