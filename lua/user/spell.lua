local spell_dir  = vim.fn.stdpath("config") .. "/spell"
local spell_file = spell_dir .. "/en.utf-8.add"
if vim.fn.isdirectory(spell_dir) == 0 then vim.fn.mkdir(spell_dir, "p") end
if vim.fn.filereadable(spell_file) == 0 then vim.fn.writefile({}, spell_file) end
vim.opt.spellfile = spell_file

vim.opt.spell = true
vim.opt.spelllang = { "en", "ru" }

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "gitcommit", "text", "plaintex" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local ext = vim.fn.expand("%:e")
    if ext == "txt" or ext == "md" then
      vim.opt_local.spell = true
    end
  end,
})

vim.api.nvim_create_augroup('telescope_spell', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = 'telescope_spell',
  pattern = { 'TelescopePrompt', 'TelescopeResults' },
  callback = function()
    vim.opt_local.spell = false
  end,
})
