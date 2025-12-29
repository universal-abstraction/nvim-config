-- plugins/langmapper.lua
--
-- Russian keyboard layout support for all keymaps
-- Automatically translates keymaps so they work with Cyrillic input

return {
  "Wansmer/langmapper.nvim",
  lazy = false,
  priority = 1,  -- Load before other plugins

  config = function()
    require("langmapper").setup({
      use_layouts = true,
      layouts = {
        ru = {
          id = "ru",
          layout = {
            "йцукенгшщзхъ",
            "фывапролджэ",
            "ячсмитьбю",
            "ЙЦУКЕНГШЩЗХЪ",
            "ФЫВАПРОЛДЖЭ",
            "ЯЧСМИТЬБЮ",
          },
          default_layout = {
            "qwertyuiop[]",
            "asdfghjkl;'",
            "zxcvbnm,.",
            "QWERTYUIOP{}",
            "ASDFGHJKL:\"",
            "ZXCVBNM<>",
          },
        },
      },
      hack_keymap = true,  -- Intercept all vim.keymap.set calls
    })

    -- Also set langmap for built-in vim commands (hjkl, etc.)
    vim.opt.langmap = table.concat({
      "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ",
      "фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz",
    }, ",")
  end,
}
