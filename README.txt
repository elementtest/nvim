README GOAL >>> give general notes on using NVIM



after you install a plugin in the plugins folder you need to install it

use :Lazy to open the lazy menu

after installed it will not be loaded load it with 

:Lazy load 

then hit tab to scroll through the various options and find the one

lazy loading will load certain parts ONLY WHEN NEEDED 

it WILL NOT load everything at once.  

setting lazy = false will make it so it loads on bootup


<<<<<<<<<<<<<<<<< PLUGINS >>>>>>>>>>>>>>>>>>>
<<PRIORITY>>
priority means it will be loaded FIRST

<<CONFIG>>
each lua plugin will take an argument called config
it gets called everytime the plugin gets loaded
it can be a function or it can be a table 

<<REQUIRE>>
used to grab EXTERNAL stuff, ie modules folders etc

ERROR:  
WARNING {nvim-tree.lua}: setting a table to `Plugin.config` is deprecated. Please use `Plugin.opts` instead
HOW TO FIX IT:: conf usually used as a table had to go in and replace 
conf with ops = { } to fix the error.  just changing one word
TO DO:: text objects in treesitter to move more quickly across code i.e. moving shortcuts for loops, moving classes, etc

ERROR:  
treesitter executabale not found
HOW TO FIX IT:  found treesitter executable and installed in $PATH.  what this meant is you echo $PATH and have folders that appear.  you choose one folder that you want to put the tree sitter executable in.  have to chmod +x it.... files downloaded on linux are not immediately executable 

BASH ERRORS <<WHEN RUNNING :checkhealth under treesitter>>
HOW TO FIX:  Run :TSInstall bash and then TSUpdate
updates the installed parsers

VIMDOC ERRORS 
HOW TO FIX:  :TSInstall vimdoc then TSUpdate

<<<<<<<<<<<<<<<< PLUGINS >>>>>>>>>>>>>>>>>>>
<<<FORMAT 1>>>
return {
  'author/<PLUG-NAME',
  lazy = false///true,
  event = "VeryLazy",
  opts = {},
  dependencies = {
    "otherauthor/otherplugin",
  }
  config = function()
  require(<PLUG-NAME>).setup(

  )
}

<<<FORMAT 2>>>
local config = function()
require(<PLUG-NAME).setup({

  })
end

return {
  "author/<PLUG-NAME>"
  lazy = false,
  config = config
}


<<<<<<<CUSTOM PERSONAL EDITS >>>>>>
configured lspconfig plugin to print neovim version number as well
as "lsp attached"

leader + h j k l keys will move in split windows 

shift tab will unhighlight search results 

leader + q will exit and ask if you want to save :confirm qall<CR>
excellent time saver


8 space or 9 space will jump ahead 1 or 2 characters 

timeout can be adjusted to set how long a leader key has to wait for 
the next key stroke 

tab unhighlights might want to change this in future. 
look into sway tiling window manager
look into dwm tiling window manager
check out TMUX
checkout live reload python program
imperative VS funtional languages
r
k
