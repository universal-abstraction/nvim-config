-- lua/plugins/venv-selector.lua
return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } }, -- optional: you can also use fzf-lua, snacks, mini-pick instead.
  },
  ft = "python", -- Load when opening Python files
   keys = {
    { "<leader>v", "<cmd>VenvSelect<cr>" }, -- Open picker on keymap
  },
  opts = {
    -- Automatically select found venv
    auto_refresh = true,

    -- Disable default searches
    -- enable_default_searches = false,

    -- Custom searches for deeply nested monorepo
    search = {
      -- Search for Python executable in .venv from project root
      root_venv = {
        command = "fd -H -I -a 'python$' $CWD/.venv/bin $CWD/../.venv/bin $CWD/../../.venv/bin",
        type = "venv",
      },
      -- Search from file directory upwards (for deeply nested files like packages/ariadnet/src/...)
      file_parent_venv = {
        command = "fd -H -I -a 'python$' $FILE_DIR/.venv/bin $FILE_DIR/../.venv/bin $FILE_DIR/../../.venv/bin $FILE_DIR/../../../.venv/bin $FILE_DIR/../../../../.venv/bin $FILE_DIR/../../../../../.venv/bin",
        type = "venv",
      },
    },

    -- Show full paths for debugging
    notify_user_on_activate = true,
  },
}
