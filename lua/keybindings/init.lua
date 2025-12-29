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

-- Plugin-specific keybindings loaded via plugin configs:
-- LSP: lua/keybindings/lsp.lua (via LspAttach autocommand)
-- Git: lua/keybindings/git.lua (via gitsigns on_attach)
-- Flash: lua/keybindings/flash.lua (via flash config)
-- Format: lua/keybindings/format.lua (via conform config)
