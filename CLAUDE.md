# Neovim Config

## Environment

- Neovim 0.12+. All plugin choices and APIs must be compatible with 0.12+.
- `nvim-treesitter` is on the `main` branch (the 0.12 rewrite). `:TSInstall` does not exist; parsers are managed via `ensure_installed` in the plugin setup.

## Guidelines

- Avoid patches and shims. Always prefer native options exposed by the plugin before working around missing behaviour.
- When adding or modifying plugins, verify compatibility with Neovim 0.12+.

## Workflow

Never modify files or create commits without first drafting a plan and getting explicit approval.

After modifying any plugin config, run `:source test/run.lua` and confirm all tests pass before committing.

## Commit style

`[scope] Short description.`

Add a body only if the commit includes a lot of changes or requires more details. Scope reflects the config area being changed: `lsp`, `treesitter`, `telescope`, `mappings`, `options`, etc.
