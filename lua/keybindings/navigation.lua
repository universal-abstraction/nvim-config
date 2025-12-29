-- keybindings/navigation.lua
--
-- Navigation through history and buffers

local map_multilang = require("keybindings.utils").map_multilang

-- Built-in Vim bindings for jump history:
-- Ctrl+O - Go back (in jump history)
-- Ctrl+I - Go forward (in jump history)
-- (works like Alt+Left/Right in VSCode)

-- Buffer navigation via leader
map_multilang("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
map_multilang("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
map_multilang("n", "<leader>bd", ":bdelete<CR>", { desc = "Close buffer" })
