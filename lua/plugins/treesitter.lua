-- treesitter.lua
--
-- Configuration for nvim-treesitter.
-- This file sets up syntax highlighting, indentation, and other features powered by tree-sitter.

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },

  -- Plugin options
  opts = {
    -- A list of parser names, or "all"
    ensure_installed = { "c","cpp","rust","python","lua","vim","vimdoc","markdown","markdown_inline","json","yaml","toml","bash" },

    -- Enable syntax highlighting
    highlight = { enable = true, additional_vim_regex_highlighting = false },

    -- Enable indentation
    indent = { enable = true },

    -- Enable incremental selection
    incremental_selection = {
      enable = true,
      keymaps = { init_selection="gnn", node_incremental="grn", scope_incremental="grc", node_decremental="grm" },
    },
  },

  -- Setup
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}