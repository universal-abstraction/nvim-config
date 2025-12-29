-- lua/plugins/mason.lua
--
-- Mason is a package manager for LSP servers, linters, formatters, etc.
-- The actual LSP server configuration is in lua/plugins/lsp.lua

return {
  {
    "mason-org/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
}
