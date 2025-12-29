-- plugins/completion.lua
--
-- Auto-completion configuration with nvim-cmp

return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert({
        -- Navigate completion list
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),

        -- Scroll documentation
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),

        -- Open/close completion menu
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),

        -- Enter confirms only if item is manually selected
        ["<CR>"] = cmp.mapping.confirm({
          select = false,  -- Don't auto-select first item
          behavior = cmp.ConfirmBehavior.Replace
        }),

        -- Shift+Enter auto-selects first item (if needed)
        ["<S-CR>"] = cmp.mapping.confirm({
          select = true,
          behavior = cmp.ConfirmBehavior.Replace
        }),

        -- Space just inserts a space, does NOT confirm completion
        ["<Space>"] = cmp.mapping(function(fallback)
          fallback()  -- Insert space as usual
        end, { "i", "s" }),
      }),

      -- Completion sources with priorities
      sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000 },   -- LSP - highest priority
        { name = "luasnip", priority = 750 },     -- Snippets - medium priority
      }, {
        { name = "buffer", priority = 500 },      -- Buffer - low priority
        { name = "path", priority = 250 },        -- Paths - lowest priority
      }),

      -- Formatting completion items
      formatting = {
        format = function(entry, vim_item)
          -- Add source to menu
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]",
          })[entry.source.name]
          return vim_item
        end,
      },

      -- Experimental features
      experimental = {
        ghost_text = false,  -- Disable ghost text (can be distracting)
      },
    })
  end,
}
