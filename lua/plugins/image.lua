-- lua/plugins/image.lua
--
-- Configuration for image support with SIXEL backend.

return {
  -- Image plugin setup for SIXEL
  {
    "3rd/image.nvim",
    lazy = false,
    build = false, -- Prevent lazy.nvim from trying to build the plugin
    opts = {
      backend = "sixel", -- Specify the sixel backend
      processor = "magick_cli", -- Use ImageMagick command-line interface
      -- Recommended for better performance with SIXEL
    --  only_render_image_at_cursor = true,
    --  only_render_image_at_cursor_mode = "popup",
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown", "vimwiki" },
        },
      },
    },
    config = function(_, opts)
      require("image").setup(opts)
    end,
  },
}
