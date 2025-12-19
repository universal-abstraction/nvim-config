-- 1. Load base settings (loaded first)
require("user.options")
require("user.keymaps")
require("user.spell")

-- 2. Setup Lazy.nvim plugin manager
-- Check if lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 3. Load plugins from lua/plugins/
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  defaults = { lazy = true },
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = true, notifu = false }, -- auto update plugins
  rocks = { enabled = false },  -- disable luarocks support
})

