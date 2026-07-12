-- keybindings/telescope.lua
--
-- Telescope and project.nvim keybindings

local map = vim.keymap.set

local function buffers_mru()
	require("telescope.builtin").buffers({
		sort_mru = true,
		sort_lastused = true,
		ignore_current_buffer = true,
	})
end

-- File finding
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find file" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find text" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffer" })
map("n", "<C-Tab>", buffers_mru, { desc = "Switch buffer (MRU)" })

-- Project management
map("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "Find project" })
