-- plugins/lualine.lua
--
-- Modern statusline with git, diagnostics, LSP, venv, and file info

local function active_lsp()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if #clients == 0 then
		return ""
	end

	local names = {}
	for _, client in ipairs(clients) do
		table.insert(names, client.name)
	end
	return "LSP: " .. table.concat(names, ",")
end

local function active_python_venv()
	if vim.bo.filetype ~= "python" then
		return ""
	end

	local ok, venv_selector = pcall(require, "venv-selector")
	if ok then
		local venv = venv_selector.venv()
		if venv and venv ~= "" then
			return "venv: " .. vim.fn.fnamemodify(venv, ":t")
		end
	end

	local venv = vim.env.VIRTUAL_ENV
	if venv and venv ~= "" then
		return "venv: " .. vim.fn.fnamemodify(venv, ":t")
	end

	return ""
end

return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	opts = {
		options = {
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			globalstatus = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { { "filename", path = 1 } },
			lualine_x = { active_python_venv, active_lsp, "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	},
}
