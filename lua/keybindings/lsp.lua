-- keybindings/lsp.lua
--
-- LSP keybindings, used via on_attach callback

local M = {}

function M.setup(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- === Core navigation (like NvChad/LazyVim) ===
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)        -- Go to Definition
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)        -- Go to References (Telescope)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)    -- Go to Implementation

  -- Documentation
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)              -- Hover documentation

  -- === Code actions ===
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)  -- Code Actions
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)       -- Rename symbol

  -- === Diagnostics (errors) ===
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)      -- Next diagnostic
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)      -- Previous diagnostic
  vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)     -- Show diagnostic (like LazyVim)

  -- === Additional LSP functions (via <leader>l) ===
  vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, opts)      -- Declaration (for C)
  vim.keymap.set("n", "<leader>lt", vim.lsp.buf.type_definition, opts)  -- Type Definition
  vim.keymap.set("n", "<leader>lh", vim.lsp.buf.signature_help, opts)   -- Signature help
  vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts)           -- Format code
end

return M
