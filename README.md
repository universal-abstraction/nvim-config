# Neovim Config

Minimal Neovim setup for Python development, automation, REST/API work, AI/LLM projects, and Git.

## Core Concepts

| Concept | Meaning |
| --- | --- |
| Buffer | An open file kept in memory. Several buffers can be open while only one is visible. |
| Window | A screen area that shows a buffer. Splits create more windows. |
| Tabpage | A collection of windows/layouts. It is not the same thing as an editor file tab. |
| Jump | A location in the jump history. LSP jumps such as `gd` can be reversed with `Ctrl-O`. |

## Main Commands

| Key | Action |
| --- | --- |
| `<leader>e` | Toggle Neo-tree explorer |
| `<leader>E` | Reveal current file in Neo-tree |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fr` | Recent files |
| `<leader>fb` | Open buffers |
| `Ctrl-Tab` | Open buffers in MRU order |
| `Ctrl-^` | Switch to alternate buffer |
| `H` / `L` | Previous / next buffer |
| `<leader>bb` | Pick buffer |
| `<leader>bp` / `<leader>bn` | Move buffer left / right in Bufferline |
| `<leader>bd` | Close current buffer |
| `<leader>bo` | Close other buffers |
| `<C-h/j/k/l>` | Move between windows |
| `<leader>wv` | Vertical split |
| `<leader>ws` | Horizontal split |
| `<leader>wd` | Close window |
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Find references |
| `gI` | Go to implementation |
| `gy` | Go to type definition |
| `K` | Hover documentation |
| `Ctrl-O` / `Ctrl-I` | Jump back / forward |
| `<leader>ca` | Code action |
| `<leader>cr` | Rename symbol |
| `<leader>cf` | Format buffer |
| `<leader>ci` | Conform info |
| `<leader>cs` | Symbols outline |
| `[d` / `]d` | Previous / next diagnostic |
| `<leader>xd` | Diagnostic under cursor |
| `<leader>xx` | Project diagnostics |
| `<leader>xX` | Current buffer diagnostics |
| `<leader>xr` | References |
| `<leader>xq` | Quickfix list |
| `<leader>xt` | TODOs |
| `[t` / `]t` | Previous / next TODO |
| `<leader>gg` | Neogit status |
| `<leader>gl` | Git log |
| `[h` / `]h` | Previous / next Git hunk |
| `<leader>gp` | Preview hunk |
| `<leader>gs` | Stage hunk |
| `<leader>gr` | Reset hunk |
| `<leader>gb` | Blame line |
| `<leader>pl` | Lazy |
| `<leader>pm` | Mason |
| `<leader>li` | LSP health |
| `<leader>vs` | Select Python virtual environment |
| `<leader>tt` | Run nearest test |
| `<leader>tf` | Run current file tests |
| `<leader>ts` | Toggle test summary |
| `<leader>to` | Open last test output |
| `Ctrl-/` | Toggle floating terminal |
| `<leader>th` | Horizontal terminal |
| `<leader>tv` | Vertical terminal |

Bufferline is only a visual list of open buffers. It is not a VS Code-style MRU switcher and it is not a replacement for Neovim tabpages. Use `Ctrl-Tab` for a Telescope MRU picker and `Ctrl-^` for the built-in alternate-buffer jump.

## Optional C/C++ Build Runner

`lua/plugins/compile-mode.lua` is kept disabled. Enable it if you want an Emacs-style `:Compile` buffer for `make -k` or compiler output with error navigation. For short one-off commands, use Toggleterm.

## Python Model

| Tool | Role |
| --- | --- |
| Pyright | Types, imports, navigation, completion |
| Ruff LSP | Lint diagnostics and quick fixes |
| Ruff format | Formatting via Conform |
| Treesitter | Syntax highlighting |
| venv-selector.nvim | Python interpreter/virtual environment selection |
| Trouble | Diagnostics, references, quickfix views |
| Neotest | Python test runner integration |
| Toggleterm | Reusable embedded terminals |
| Aerial | Current-file symbols outline |
| Todo-comments | TODO/FIXME/HACK/WARN/PERF/NOTE tracking |
| Bufferline | Visual list of open buffers |

Useful diagnostics:

```vim
:checkhealth
:checkhealth vim.lsp
:checkhealth vim.treesitter
:Lazy
:Mason
:ConformInfo
:set filetype?
:verbose set filetype?
```
