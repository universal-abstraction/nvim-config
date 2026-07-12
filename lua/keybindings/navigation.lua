-- keybindings/navigation.lua
--
-- Navigation through history and buffers

local map = vim.keymap.set

local function bufferline_or_buffer(command, fallback)
	if vim.fn.exists(":" .. command) == 2 then
		vim.cmd(command)
	else
		vim.cmd(fallback)
	end
end

local function bufferline_command(command)
	if vim.fn.exists(":" .. command) == 2 then
		vim.cmd(command)
	else
		vim.notify(command .. " is not available", vim.log.levels.WARN)
	end
end

-- Buffer navigation (direct keys, LazyVim style)
-- H/L override vim's "top/bottom of screen" for fast buffer switching.
map("n", "H", function()
	bufferline_or_buffer("BufferLineCyclePrev", "bprevious")
end, { desc = "Previous buffer", silent = true })
map("n", "L", function()
	bufferline_or_buffer("BufferLineCycleNext", "bnext")
end, { desc = "Next buffer", silent = true })

-- Buffer operations via leader
map("n", "<leader>bb", "<cmd>Telescope buffers<CR>", { desc = "Find buffer" })
map("n", "<leader>bp", function()
	bufferline_command("BufferLineMovePrev")
end, { desc = "Move buffer left", silent = true })
map("n", "<leader>bn", function()
	bufferline_command("BufferLineMoveNext")
end, { desc = "Move buffer right", silent = true })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Close buffer" })
map("n", "<leader>bo", function()
	local current = vim.api.nvim_get_current_buf()
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		if bufnr ~= current and vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].buflisted then
			vim.api.nvim_buf_delete(bufnr, {})
		end
	end
end, { desc = "Close other buffers", silent = true })

-- Window movement and layout
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", silent = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", silent = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", silent = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", silent = true })

map("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "Vertical split" })
map("n", "<leader>ws", "<cmd>split<CR>", { desc = "Horizontal split" })
map("n", "<leader>wd", "<cmd>close<CR>", { desc = "Close window" })
