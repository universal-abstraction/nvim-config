-- keybindings/lsp.lua
--
-- LSP keybindings, used via on_attach callback

local M = {}

function M.setup(client, bufnr)
	local function opts(desc)
		return { noremap = true, silent = true, buffer = bufnr, desc = desc }
	end

	local map = vim.keymap.set
	local telescope = require("telescope.builtin")

	-- === Core navigation (g-prefix, standard) ===
	-- Using Telescope for multi-result locations.
	map("n", "gd", telescope.lsp_definitions, opts("Go to definition"))
	map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
	map("n", "gr", telescope.lsp_references, opts("Go to references"))
	map("n", "gI", telescope.lsp_implementations, opts("Go to implementation"))
	map("n", "gy", telescope.lsp_type_definitions, opts("Go to type definition"))
	map("n", "K", vim.lsp.buf.hover, opts("Hover documentation"))

	-- === Code actions (leader) ===
	map("n", "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
	map("n", "<leader>cr", vim.lsp.buf.rename, opts("Rename symbol"))

	-- === Additional LSP functions ===
	map("n", "<leader>lh", vim.lsp.buf.signature_help, opts("Signature help"))
end

return M
