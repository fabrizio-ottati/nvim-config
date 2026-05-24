return {
  "nvim-treesitter/nvim-treesitter",
  -- The main branch is now 0.12+ only
  branch = "main",
  build = ":TSUpdate",
  dependencies = {
    "HiPhish/rainbow-delimiters.nvim",
  },
  config = function()
    local ts = require("nvim-treesitter")
    
    -- In the 0.12 rewrite, we use the direct module
    ts.setup({
      ensure_installed = {
        "lua", "vim", "vimdoc", "python",
        "c", "cpp", "bash",
        "llvm", "mlir", "tablegen"
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
