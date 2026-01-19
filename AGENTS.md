# Repository Guidelines

## Project Structure & Module Organization
This is a Neovim configuration repo. Core entrypoint and modules:
- `init.lua` — sets leader, loads base settings, bootstraps `lazy.nvim`.
- `lua/user/` — base options, autocommands, spell setup, utilities.
- `lua/plugins/` — plugin specs and configuration (one file per plugin).
- `lua/keybindings/` — keymap modules grouped by domain (core, lsp, git, etc.).
- `lazy-lock.json` — pinned plugin versions.
- `spell/` — local spell files.

## Build, Test, and Development Commands
There is no build system or automated test suite in this repo. Useful local actions:
- `nvim` — launch Neovim with this config.
- `:Lazy` — open plugin manager UI to install/update plugins.
- `:Lazy sync` — install/update plugins and clean unused ones.
- `:checkhealth` — verify runtime dependencies (LSP, clipboard, etc.).

## Coding Style & Naming Conventions
- Lua style is simple and direct; keep modules small and file‑scoped.
- Indentation: 2 spaces (matching current Lua files).
- Naming: snake_case for Lua locals, `M` table for modules, one plugin per file.
- Prefer `vim.opt`/`vim.o` and `vim.keymap.set` for configuration.

## Testing Guidelines
No automated tests are defined. Validate changes manually:
- Open Neovim and confirm startup is clean.
- Use `:messages`, `:checkhealth`, and `:Lazy` to spot errors.

## Commit & Pull Request Guidelines
- Commit messages follow Conventional Commits (e.g., `feat: ...`, `refactor: ...`, `revert: ...`).
- Keep commits scoped and descriptive.
- For PRs: include a concise summary, list user‑visible changes, and mention any new keymaps or plugin additions.

## Configuration Notes
- LSP uses the Neovim 0.11+ native API in `lua/plugins/lsp/servers.lua`.
- Some plugins depend on external tools (e.g., `fd`, `ripgrep`, formatters). Ensure they are installed if you enable related features.
- Input layout autoswitch relies on `hyprctl` (Hyprland) and focus events for `FocusGained/FocusLost`.
