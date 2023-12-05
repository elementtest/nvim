-- rename both open and close tags in html i.e. <head> </head>
return {
  "windwp/nvim-ts-autotag",
  lazy = false,
  opts = {},
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
}
