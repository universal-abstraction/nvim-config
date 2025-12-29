-- plugins/lsp/servers.lua
--
-- LSP server configurations using Neovim 0.11+ native API
-- Keybindings are set via LspAttach in lua/user/autocommands.lua

-- Add blink.cmp capabilities to all LSP servers
local has_blink, blink = pcall(require, "blink.cmp")
if has_blink then
  vim.lsp.config("*", {
    capabilities = blink.get_lsp_capabilities(),
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
