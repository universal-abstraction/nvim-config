-- user/autocommands.lua
--
-- Autocommands for various file types and events

-- Markdown: word wrapping
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
  end,
})

-- Spell checking for text files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "gitcommit", "text", "plaintex" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- Additional check for .txt and .md files on open
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local ext = vim.fn.expand("%:e")
    if ext == "txt" or ext == "md" then
      vim.opt_local.spell = true
    end
  end,
})

-- Disable spell checking in Telescope UI
vim.api.nvim_create_augroup('telescope_spell', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = 'telescope_spell',
  pattern = { 'TelescopePrompt', 'TelescopeResults' },
  callback = function()
    vim.opt_local.spell = false
  end,
})
