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
