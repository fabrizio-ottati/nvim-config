# Neovim Config

Neovim 0.12+. Plugins managed by [lazy.nvim](https://github.com/folke/lazy.nvim). Leader key: `Space`.

## Dependencies

- [Neovim](https://neovim.io/) 0.12+
- [`tree-sitter-cli`](https://github.com/tree-sitter/tree-sitter) — required by nvim-treesitter (`main` branch) to compile parsers. Install via `cargo install tree-sitter-cli` or from the [GitHub releases](https://github.com/tree-sitter/tree-sitter/releases). Note: `brew install tree-sitter` installs the C library only, not the CLI.

## Plugins

### Colorscheme

- **[oceanic-next](https://github.com/mhartington/oceanic-next)** — OceanicNext dark theme. Loads eagerly so the UI doesn't flicker. Bold and italic terminal colours enabled.

### Statusline

- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** — statusline using the OceanicNext theme.
- **[nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)** — filetype icons used by lualine.

### Syntax & Highlighting

- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** (`branch: main` — Neovim 0.12+ rewrite) — parser-based syntax highlighting and indentation. Installed parsers: lua, vim, vimdoc, python, c, cpp, bash, llvm, mlir, tablegen.
- **[rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim)** — colours nested brackets via treesitter. Loaded as a treesitter dependency.

### LSP

- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** — configures language servers.
- **[mason.nvim](https://github.com/williamboman/mason.nvim)** — installs and manages LSP servers, linters, and formatters.
- **[mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)** — bridges mason and lspconfig. Auto-installs: `pyright` (Python), `rust_analyzer` (Rust), `clangd` (C/C++/MLIR — extended with `--mlir-tidy` and mlir filetype support).

### Completion

- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** — completion engine.
- **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)** — snippet engine integrated with nvim-cmp.
- Sources in priority order: LSP → snippets → buffer text → file paths.

### Formatting

- **[conform.nvim](https://github.com/stevearc/conform.nvim)** — formats on save. Formatters: `clang-format` (C/C++), `ruff` (Python). Falls back to LSP formatting for other filetypes.

### Navigation

- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** (`0.1.x`) — fuzzy finder for files, live grep, buffers, and LSP symbols. Backed by [plenary.nvim](https://github.com/nvim-lua/plenary.nvim).
- **[neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)** (`v3.x`) — file explorer. Auto-closes on file open, follows the current file, pure-text mode (no icons).

### Terminal

- **[toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)** — floating terminal with a curved border. Also provides a persistent lazygit terminal.
