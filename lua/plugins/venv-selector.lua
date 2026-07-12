-- lua/plugins/venv-selector.lua
--
-- Python virtual environment selector
return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-telescope/telescope.nvim", -- Use main telescope config (no branch conflict)
	},
	cmd = "VenvSelect",
	ft = "python", -- Load when opening Python files
	opts = {
		options = {
			notify_user_on_venv_activation = true,
		},

		-- Custom searches for deeply nested monorepo
		search = {
			-- Search for Python executable in .venv/venv from project root
			project_venv = {
				command = "fd -H -I -a 'python$' $CWD/.venv/bin $CWD/venv/bin $CWD/../.venv/bin $CWD/../venv/bin $CWD/../../.venv/bin $CWD/../../venv/bin",
				type = "venv",
			},
			-- Search from file directory upwards (for deeply nested files like packages/ariadnet/src/...)
			file_parent_venv = {
				command = "fd -H -I -a 'python$' $FILE_DIR/.venv/bin $FILE_DIR/venv/bin $FILE_DIR/../.venv/bin $FILE_DIR/../venv/bin $FILE_DIR/../../.venv/bin $FILE_DIR/../../venv/bin $FILE_DIR/../../../.venv/bin $FILE_DIR/../../../venv/bin $FILE_DIR/../../../../.venv/bin $FILE_DIR/../../../../venv/bin $FILE_DIR/../../../../../.venv/bin $FILE_DIR/../../../../../venv/bin",
				type = "venv",
			},
		},
	},
}
