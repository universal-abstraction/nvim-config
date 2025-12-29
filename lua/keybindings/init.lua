-- keybindings/init.lua
--
-- Aggregator for all keybinding modules
-- (leader key is set in init.lua BEFORE loading lazy.nvim)

-- Load core keybindings
require("keybindings.core")

-- Load telescope keybindings
require("keybindings.telescope")

-- Load navigation keybindings
require("keybindings.navigation")

-- LSP keybindings are loaded automatically via on_attach in lua/plugins/lsp.lua
