-- plugins/mason.lua
--
-- Mason package manager UI configuration
-- LSP server configuration is in lua/plugins/lsp/

return {
  "mason-org/mason.nvim",
  lazy = false,
  opts = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },
}
