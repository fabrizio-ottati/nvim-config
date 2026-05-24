local map = vim.keymap.set

-- General
map("n", "<Esc>", "<cmd>nohlsearch<cr>")

-- Window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Diagnostic navigation
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)

-- LSP keymaps (buffer-local, set on LspAttach in autocmds.lua):
--   gd            vim.lsp.buf.definition
--   K             vim.lsp.buf.hover
--   <leader>rn    vim.lsp.buf.rename
--   <leader>ca    vim.lsp.buf.code_action

-- Plugin-managed keys (defined in plugin spec `keys` tables):
--   <leader>e           neotree toggle          (neotree.lua)
--   <M-t>               toggleterm toggle        (toggleterm.lua)
--   <leader>g           lazygit                  (toggleterm.lua)
--   <leader>ff/fg/fb    telescope files/grep/buffers
--   <leader>ls/ws/D     telescope LSP symbols/diagnostics
