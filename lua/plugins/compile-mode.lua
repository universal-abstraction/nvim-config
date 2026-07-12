-- plugins/compile-mode.lua
--
-- Optional C/C++ build runner. It keeps compiler output in a dedicated
-- compilation buffer and can jump between parsed errors. ToggleTerm remains
-- the default place for ad-hoc shell commands.

return {
	"ej-shafran/compile-mode.nvim",
	enabled = false,
	version = "^5.0.0",
	cmd = {
		"Compile",
		"Recompile",
		"FirstError",
		"CurrentError",
		"NextError",
		"PrevError",
		"QuickfixErrors",
		"CompileInterrupt",
		"CompileCloseBuffer",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "m00qek/baleia.nvim", tag = "v1.3.0" },
	},
	init = function()
		---@type CompileModeOpts
		vim.g.compile_mode = {
			default_command = "make -k ",

			-- if you use something like `nvim-cmp` or `blink.cmp` for completion,
			-- set this to fix tab completion in command mode:
			input_word_completion = true,

			-- to add ANSI escape code support, add:
			baleia_setup = true,

			-- to make `:Compile` replace special characters (e.g. `%`) in
			-- the command (and behave more like `:!`), add:
			-- bang_expansion = true,
		}
	end,
}
