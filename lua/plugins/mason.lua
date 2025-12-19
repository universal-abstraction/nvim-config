-- lua/plugins/mason.lua
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
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        -- A list of servers to automatically install if they're not already installed.
        ensure_installed = {
          "pyright",
          "clangd",
          "rust_analyzer",
          "lua_ls",
        },
      })
    end,
  },
}
