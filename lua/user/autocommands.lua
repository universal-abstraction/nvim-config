-- user/autocommands.lua
--
-- Autocommands for various file types and events
-- Note: Spell checking is enabled globally in user/spell.lua

-- Markdown: word wrapping
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
  end,
})

-- Disable spell checking in special buffers
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "TelescopePrompt", "TelescopeResults", "lazy", "mason", "help" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- LSP keybindings on attach (mason-lspconfig v2 compatible)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf
    require("keybindings.lsp").setup(client, bufnr)
  end,
})
