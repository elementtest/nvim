-- file explorer with vim like motions i.e. o will open up a new line save and 
-- new file will be created
-- create a directory with a file in it type:::: directoryname/filename.lua
-- can also move files around with dd (delete file) and then p to paste wherever
return {
  'stevearc/oil.nvim',
  opts = {},
  lazy = false,
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
      vim.keymap.set('n', '-', '<CMD>Oil<CR>')
      require('oil').setup({
          --send deleted files to trash instead of permanent delete
          delete_to_trash = false,
          keymaps = {
              -- save changes that are made in oil
            ['q'] = ':w<CR>',
          }
      })
      --open oil directory // also goes up a directory while in oil
  end

}
