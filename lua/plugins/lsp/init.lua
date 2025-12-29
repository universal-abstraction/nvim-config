-- plugins/lsp/init.lua
--
-- LSP configuration using nvim-lspconfig as convenience layer
-- Server configs are in servers.lua, keybindings via LspAttach in autocommands.lua

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      "mason-lspconfig.nvim",
    },
    config = function()
      require("plugins.lsp.servers")
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = true,
    dependencies = { "mason.nvim" },
    opts = {
      ensure_installed = { "pyright", "clangd", "rust_analyzer", "lua_ls" },
    },
  },
}
