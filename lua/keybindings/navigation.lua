-- keybindings/navigation.lua
--
-- Navigation through history and buffers
-- Russian layout handled by langmapper.nvim

local map = vim.keymap.set

-- Built-in Vim bindings for jump history:
-- Ctrl+O - Go back (in jump history)
-- Ctrl+I - Go forward (in jump history)

-- Buffer navigation (direct keys, LazyVim style)
-- H/L override vim's "top/bottom of screen" — rarely used
map("n", "H", ":bprevious<CR>", { desc = "Previous buffer", silent = true })
map("n", "L", ":bnext<CR>", { desc = "Next buffer", silent = true })

-- Buffer close via leader
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Close buffer" })
