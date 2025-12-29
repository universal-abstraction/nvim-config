-- keybindings/utils.lua
--
-- Utilities for key bindings, including Russian keyboard layout support

local M = {}

-- Mapping table for English to Russian keyboard layout
local ru = {
  ["q"]="й",["w"]="ц",["e"]="у",["r"]="к",["t"]="е",
  ["y"]="н",["u"]="г",["i"]="ш",["o"]="щ",["p"]="з",
  ["a"]="ф",["s"]="ы",["d"]="в",["f"]="а",["g"]="п",
  ["h"]="р",["j"]="о",["k"]="л",["l"]="д",
  ["z"]="я",["x"]="ч",["c"]="с",["v"]="м",["b"]="и",
  ["n"]="т",["m"]="ь"
}

-- Function to create keybindings with Russian keyboard layout support
-- Automatically creates two bindings: one for English, one for Russian layout
function M.map_multilang(mode, lhs, rhs, opts)
  opts = opts or {}

  -- English keybinding
  vim.keymap.set(mode, lhs, rhs, opts)

  -- Russian keybinding (convert English characters to Russian)
  local lhs_ru = lhs:gsub(".", function(c) return ru[c] or c end)
  vim.keymap.set(mode, lhs_ru, rhs, opts)
end

return M
