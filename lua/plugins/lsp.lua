return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,  -- Load immediately to ensure LSP attaches to buffers
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",  -- For LSP capabilities
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      -- LSP capabilities for nvim-cmp integration (with fallback)
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities = has_cmp
        and cmp_nvim_lsp.default_capabilities()
        or vim.lsp.protocol.make_client_capabilities()

      -- Common on_attach function for all LSP servers
      local function on_attach(client, bufnr)
        require("keybindings.lsp").setup(client, bufnr)
      end

      -- Setup mason-lspconfig
      mason_lspconfig.setup({
        ensure_installed = {
          "pyright",
          "clangd",
          "rust_analyzer",
          "lua_ls",
        },
        handlers = {
          -- Default handler for all servers
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities,
              on_attach = on_attach,
            })
          end,

          -- Custom handler for lua_ls with additional settings
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              on_attach = on_attach,
              settings = {
                Lua = {
                  runtime = { version = "LuaJIT" },
                  diagnostics = { globals = { "vim" } },
                  workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                },
              },
            })
          end,
        },
      })

      -- Diagnostic configuration
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
      })
    end,
  },
}

