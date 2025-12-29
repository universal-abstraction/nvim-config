-- keybindings/navigation.lua
--
-- Navigation through history and buffers

local map_multilang = require("keybindings.utils").map_multilang

-- Built-in Vim bindings for jump history:
-- Ctrl+O - Go back (in jump history)
-- Ctrl+I - Go forward (in jump history)

-- Buffer navigation (direct keys, LazyVim style)
-- H/L override vim's "top/bottom of screen" — rarely used
vim.keymap.set("n", "H", ":bprevious<CR>", { desc = "Previous buffer", silent = true })
vim.keymap.set("n", "L", ":bnext<CR>", { desc = "Next buffer", silent = true })

-- Buffer close via leader
map_multilang("n", "<leader>bd", ":bdelete<CR>", { desc = "Close buffer" })
