return {
  'stevearc/oil.nvim',
  opts = {},
  lazy = false,
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
      require('oil').setup({})
      --open oil directory 
      vim.keymap.set('n', '-', '<CMD>Oil<CR>')
  end

}
