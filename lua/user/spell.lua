-- Initialize spell directory and file
local spell_dir  = vim.fn.stdpath("config") .. "/spell"
local spell_file = spell_dir .. "/en.utf-8.add"
if vim.fn.isdirectory(spell_dir) == 0 then vim.fn.mkdir(spell_dir, "p") end
if vim.fn.filereadable(spell_file) == 0 then vim.fn.writefile({}, spell_file) end
vim.opt.spellfile = spell_file

-- Global spell checking settings
vim.opt.spell = true
vim.opt.spelllang = { "en", "ru" }

-- Configure highlight for spell checking (undercurl without bright background)
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- SpellBad - misspelled word (muted red)
    vim.api.nvim_set_hl(0, "SpellBad", {
      undercurl = true,
      sp = "#f7768e",  -- Muted red from tokyonight
      bg = "NONE",     -- No background
    })

    -- SpellCap - word should start with capital letter (orange)
    vim.api.nvim_set_hl(0, "SpellCap", {
      undercurl = true,
      sp = "#e0af68",  -- Orange from tokyonight
      bg = "NONE",
    })

    -- SpellRare - rare word (purple)
    vim.api.nvim_set_hl(0, "SpellRare", {
      undercurl = true,
      sp = "#9d7cd8",  -- Purple from tokyonight
      bg = "NONE",
    })

    -- SpellLocal - word recognized as wrong in another region
    vim.api.nvim_set_hl(0, "SpellLocal", {
      undercurl = true,
      sp = "#73daca",  -- Blue from tokyonight
      bg = "NONE",
    })
  end,
})

-- Apply highlight immediately after loading
vim.cmd("doautocmd ColorScheme")
