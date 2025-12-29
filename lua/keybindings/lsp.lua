-- keybindings/lsp.lua
--
-- LSP keybindings, used via on_attach callback
-- Russian layout handled by langmapper.nvim

local M = {}

function M.setup(client, bufnr)
  local function opts(desc)
    return { noremap = true, silent = true, buffer = bufnr, desc = desc }
  end

  local map = vim.keymap.set

  -- === Core navigation (g-prefix, standard) ===
  map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
  map("n", "gr", vim.lsp.buf.references, opts("Go to references"))
  map("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
  map("n", "K", vim.lsp.buf.hover, opts("Hover documentation"))

  -- === Diagnostics ===
  map("n", "]d", vim.diagnostic.goto_next, opts("Next diagnostic"))
  map("n", "[d", vim.diagnostic.goto_prev, opts("Previous diagnostic"))
  map("n", "gl", vim.diagnostic.open_float, opts("Show diagnostic"))

  -- === Code actions (leader) ===
  map("n", "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
  map("n", "<leader>cr", vim.lsp.buf.rename, opts("Rename symbol"))

  -- === Additional LSP functions ===
  map("n", "<leader>ld", vim.lsp.buf.declaration, opts("Declaration"))
  map("n", "<leader>lt", vim.lsp.buf.type_definition, opts("Type definition"))
  map("n", "<leader>lh", vim.lsp.buf.signature_help, opts("Signature help"))
end

return M
