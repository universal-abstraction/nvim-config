-- plugins/autopairs.lua
--
-- Auto close brackets, quotes, and other pairs

return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",

  opts = {
    check_ts = true,  -- Use treesitter to check for pairs
    fast_wrap = {
      map = "<M-e>",  -- Alt+e to wrap with pair
    },
  },
}
