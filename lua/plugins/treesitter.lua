return {
  "nvim-treesitter/nvim-treesitter",
  -- The main branch is now 0.12+ only
  branch = "main",
  build = ":TSUpdate",
  dependencies = {
    "HiPhish/rainbow-delimiters.nvim",
  },
  config = function()
    require("nvim-treesitter").setup()

    -- Install parsers not bundled with Neovim (async, no-op if already installed)
    require("nvim-treesitter").install({ "llvm", "mlir", "tablegen" })
  end,
}
