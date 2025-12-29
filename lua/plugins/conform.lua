-- plugins/conform.lua
--
-- Code formatting with format-on-save
-- Keybindings: lua/keybindings/format.lua

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },

  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_format", "black", stop_after_first = true },
      rust = { "rustfmt" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      json = { "jq" },
      yaml = { "yamlfmt" },
      markdown = { "prettier" },
    },

    format_on_save = function(bufnr)
      -- Disable for certain filetypes
      local ignore_filetypes = { "sql", "java" }
      if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
        return
      end
      return { timeout_ms = 500, lsp_format = "fallback" }
    end,
  },

  config = function(_, opts)
    require("conform").setup(opts)
    require("keybindings.format").setup()
  end,
}
