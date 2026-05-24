return {
  'akinsho/toggleterm.nvim',
  version = "*",
  -- 1. Register the keys at the TOP level so Lazy.nvim sees them immediately
  keys = {
    { "<M-t>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
  },
  opts = {
    -- 2. Setting open_mapping to nil prevents the plugin from trying 
    -- to create its own (potentially conflicting) internal mapping.
    open_mapping = nil, 
    direction = 'float',
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    float_opts = {
      border = 'curved',
      winblend = 3,
    },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- 3. Terminal-specific escape logic
    function _G.set_terminal_keymaps()
      local map_opts = {buffer = 0}
      -- Exit terminal mode with jk
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], map_opts)
      -- Allow M-t to toggle it CLOSED while inside terminal mode
      vim.keymap.set('t', '<M-t>', [[<Cmd>ToggleTerm<CR>]], map_opts)
    end

    vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

    -- 4. Lazygit Custom Terminal
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
    vim.keymap.set("n", "<leader>g", function() lazygit:toggle() end, {desc = "Toggle Lazygit"})
  end
}
