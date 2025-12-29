-- keybindings/lsp.lua
--
-- LSP keybindings, used via on_attach callback

local M = {}

-- Russian keyboard layout mapping (for leader-based keybindings)
local ru = {
  ["q"]="й",["w"]="ц",["e"]="у",["r"]="к",["t"]="е",
  ["y"]="н",["u"]="г",["i"]="ш",["o"]="щ",["p"]="з",
  ["a"]="ф",["s"]="ы",["d"]="в",["f"]="а",["g"]="п",
  ["h"]="р",["j"]="о",["k"]="л",["l"]="д",
  ["z"]="я",["x"]="ч",["c"]="с",["v"]="м",["b"]="и",
  ["n"]="т",["m"]="ь"
}

-- Buffer-local multilang keymap (for Russian keyboard support)
local function map_buf_multilang(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
  local lhs_ru = lhs:gsub(".", function(c) return ru[c] or c end)
  if lhs_ru ~= lhs then
    vim.keymap.set(mode, lhs_ru, rhs, opts)
  end
end

function M.setup(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- === Core navigation (standard Vim-style, no Russian needed) ===
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)        -- Go to Definition
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)        -- Go to References
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)    -- Go to Implementation
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)              -- Hover documentation

  -- === Diagnostics (standard Vim-style) ===
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)      -- Next diagnostic
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)      -- Previous diagnostic
  vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)     -- Show diagnostic

  -- === Code actions (with Russian keyboard support) ===
  map_buf_multilang("n", "<leader>ca", vim.lsp.buf.code_action, opts)  -- Code Actions
  map_buf_multilang("n", "<leader>cr", vim.lsp.buf.rename, opts)       -- Rename symbol

  -- === Additional LSP functions (with Russian keyboard support) ===
  map_buf_multilang("n", "<leader>ld", vim.lsp.buf.declaration, opts)      -- Declaration (for C)
  map_buf_multilang("n", "<leader>lt", vim.lsp.buf.type_definition, opts)  -- Type Definition
  map_buf_multilang("n", "<leader>lh", vim.lsp.buf.signature_help, opts)   -- Signature help
end

return M
