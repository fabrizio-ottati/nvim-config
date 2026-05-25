return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- 1. Setup Mason
      require("mason").setup()

      -- 2. Setup Mason-Lspconfig with handlers
      require("mason-lspconfig").setup({
        ensure_installed = {
          "pyright",
          "clangd",
        },
        -- This replaces the manual setup_handlers call
        handlers = {
          -- The first entry is the default setup for all servers
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,

          -- You can add specific overrides here
          ["clangd"] = function()
            require("lspconfig").clangd.setup({
              cmd = { "clangd", "--background-index", "--mlir-tidy" },
              filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "mlir" },
            })
          end,
        },
      })

    end,
  },
}
