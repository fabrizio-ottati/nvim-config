return {
  {
    "mhartington/oceanic-next",
    lazy = false, -- Load this immediately so the UI doesn't flicker
    priority = 1000, -- Make sure it loads before other plugins
    config = function()
      vim.g.oceanic_next_terminal_bold = 1
      vim.g.oceanic_next_terminal_italic = 1
      
      vim.cmd([[colorscheme OceanicNext]])
    end,
  },
}
