-- colorizer for nvim
return {
  "NvChad/nvim-colorizer.lua",
  lazy = false,
  priority = 999,
  config = function()
    require'colorizer'.setup()
  end
}

