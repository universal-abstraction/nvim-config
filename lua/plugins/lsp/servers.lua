-- plugins/lsp/servers.lua
--
-- LSP server configurations using Neovim 0.11+ native API
-- Keybindings are set via LspAttach in lua/user/autocommands.lua

-- Add blink.cmp capabilities to all LSP servers
local has_blink, blink = pcall(require, "blink.cmp")
if has_blink then
	vim.lsp.config("*", {
		capabilities = blink.get_lsp_capabilities(),
	})
end

-- lua_ls: Neovim Lua development
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
})

-- pyright handles Python types, imports, navigation, and completion. Ruff owns
-- lint-style diagnostics to avoid duplicate warnings.
vim.lsp.config("pyright", {
	settings = {
		pyright = {
			disableTaggedHints = true,
		},
		python = {
			analysis = {
				diagnosticSeverityOverrides = {
					reportUnusedImport = "none",
					reportUnusedVariable = "none",
				},
			},
		},
	},
})

-- Ruff handles Python lint diagnostics and quick fixes. Pyright remains the
-- primary Python type-checking/navigation server.
vim.lsp.config("ruff", {
	on_attach = function(client)
		client.server_capabilities.hoverProvider = false
	end,
	init_options = {
		settings = {
			lineLength = 88,
		},
	},
})

-- Enable all installed servers
vim.lsp.enable({ "pyright", "ruff", "clangd", "rust_analyzer", "lua_ls" })

-- Diagnostic display configuration
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})
