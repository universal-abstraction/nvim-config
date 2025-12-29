-- plugins/lsp/servers.lua
--
-- LSP server configurations using Neovim 0.11+ native API
-- Keybindings are set via LspAttach in lua/user/autocommands.lua

-- Add nvim-cmp capabilities to all LSP servers
local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if has_cmp then
  vim.lsp.config("*", {
    capabilities = cmp_nvim_lsp.default_capabilities(),
  })
end

-- lua_ls: Neovim Lua development
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})

-- Enable all installed servers
vim.lsp.enable({ "pyright", "clangd", "rust_analyzer", "lua_ls" })

-- Diagnostic display configuration
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
