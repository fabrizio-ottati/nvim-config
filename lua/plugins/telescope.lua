return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      },
      pickers = {
        lsp_references = {
          initial_mode = "normal",
        },
      },
    })
  end,
  keys = {
    -- File Navigation
    { "<leader>ff", "<cmd>Telescope find_files<cr>",  desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>",   desc = "Live Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",     desc = "Buffers" },

    -- LSP Integration
    { "<leader>ls",  "<cmd>Telescope lsp_document_symbols<cr>",          desc = "LSP Document Symbols" },
    { "<leader>ws",  "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "LSP Workspace Symbols" },
    { "<leader>D",   "<cmd>Telescope diagnostics<cr>",                   desc = "LSP Diagnostics" },
  },
}
