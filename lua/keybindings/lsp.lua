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
  local function opts(desc)
    return { noremap = true, silent = true, buffer = bufnr, desc = desc }
  end

  -- === Core navigation (standard Vim-style, no Russian needed) ===
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("Go to references"))
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Hover documentation"))

  -- === Diagnostics (standard Vim-style) ===
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts("Next diagnostic"))
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts("Previous diagnostic"))
  vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts("Show diagnostic"))

  -- === Code actions (with Russian keyboard support) ===
  map_buf_multilang("n", "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
  map_buf_multilang("n", "<leader>cr", vim.lsp.buf.rename, opts("Rename symbol"))

  -- === Additional LSP functions (with Russian keyboard support) ===
  map_buf_multilang("n", "<leader>ld", vim.lsp.buf.declaration, opts("Declaration"))
  map_buf_multilang("n", "<leader>lt", vim.lsp.buf.type_definition, opts("Type definition"))
  map_buf_multilang("n", "<leader>lh", vim.lsp.buf.signature_help, opts("Signature help"))
end

return M
