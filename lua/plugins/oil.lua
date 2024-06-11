return {
  'stevearc/oil.nvim',
  opts = {},
  lazy = false,
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
      vim.keymap.set('n', '-', '<CMD>Oil<CR>')
      require('oil').setup({
          keymaps = {
            ['<C-S>'] = ':w<CR>',
          }
      })
      --open oil directory // also goes up a directory while in oil
  end

}
