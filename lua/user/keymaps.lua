local map = vim.keymap.set
vim.g.mapleader = " "

local ru = {
  ["q"]="й",["w"]="ц",["e"]="у",["r"]="к",["t"]="е",
  ["y"]="н",["u"]="г",["i"]="ш",["o"]="щ",["p"]="з",
  ["a"]="ф",["s"]="ы",["d"]="в",["f"]="а",["g"]="п",
  ["h"]="р",["j"]="о",["k"]="л",["l"]="д",
  ["z"]="я",["x"]="ч",["c"]="с",["v"]="м",["b"]="и",
  ["n"]="т",["m"]="ь"
}

local function map_multilang(mode, lhs, rhs, opts)
  opts = opts or {}
  map(mode, lhs, rhs, opts)
  local lhs_ru = lhs:gsub(".", function(c) return ru[c] or c end)
  map(mode, lhs_ru, rhs, opts)
end

-- Basic Keybindings
map_multilang("n", "<leader>ww", ":w<cr>", { desc = "save" })
map_multilang("n", "<leader>qq", ":q<CR>", { desc = "Close" })
map_multilang("n", "<leader>wq", ":wq<CR>", { desc = "Save & Close" })
map_multilang("n", "<leader>hh", ":nohlsearch<CR>", { desc = "Hide search highlight" })
map_multilang("n", "<leader>lz", ":Lazy<cr>", { desc = "open lazy" })
map_multilang("n", "<leader>дя", ":Lazy<cr>", { desc = "open lazy" })
      
