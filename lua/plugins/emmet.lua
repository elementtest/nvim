return {
  "olrtg/nvim-emmet",
  -- Using 'keys' ensures the mapping exists on startup 
  -- and triggers the plugin to load only when pressed.
  keys = {
    { 
      "<leader>we", 
      function() require('nvim-emmet').wrap_with_abbreviation() end, 
      mode = { "n", "v" }, 
      desc = "Emmet Wrap" 
    },
  },
}

