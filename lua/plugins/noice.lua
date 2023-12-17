-- nicer nvim UI instead of forced at bottom i.e. : commandline
-- note experimental (COULD CAUSE PROBLEMS)
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {},
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "rcarriga/nvim-notify",
      config = function()
        require("notify").setup({
          background_colour = "000000"
        })
      end,
    }
  }

}
