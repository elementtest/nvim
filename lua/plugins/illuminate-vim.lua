-- illuminates all instances of a keyword in doc
-- use alt + n or alt + p to navigate through instances
return {
  "RRethy/vim-illuminate",
  lazy = false,
  config = function()
    require('illuminate').configure({})
  end
}
