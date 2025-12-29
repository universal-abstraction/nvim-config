-- plugins/comment.lua
--
-- Smart code commenting for all languages

return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("Comment").setup({
      -- Keybindings
      toggler = {
        line = "gcc",  -- Toggle comment on current line in normal mode
        block = "gbc", -- Toggle block comment
      },
      opleader = {
        line = "gc",   -- gc + motion (e.g., gcj - comment 2 lines)
        block = "gb",  -- gb + motion for block comment
      },

      -- Additional bindings
      extra = {
        above = "gcO", -- Add comment on the line above
        below = "gco", -- Add comment on the line below
        eol = "gcA",   -- Add comment at the end of line
      },

      -- Enable in visual mode
      mappings = {
        basic = true,    -- gcc, gbc, gc[motion], gb[motion]
        extra = true,    -- gcO, gco, gcA
      },
    })
  end,
}
