-- keybindings/core.lua
--
-- Core editor keybindings (not plugin-specific)

local map_multilang = require("keybindings.utils").map_multilang

-- File operations
map_multilang("n", "<leader>ww", ":w<cr>", { desc = "Save" })
map_multilang("n", "<leader>qq", ":q<CR>", { desc = "Close" })
map_multilang("n", "<leader>wq", ":wq<CR>", { desc = "Save & Close" })

-- UI
map_multilang("n", "<leader>hh", ":nohlsearch<CR>", { desc = "Hide search highlight" })

-- Plugin management
map_multilang("n", "<leader>lz", ":Lazy<cr>", { desc = "Open Lazy" })
