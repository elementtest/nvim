-- set spacebar as mapleader key
vim.g.mapleader = " "

-- <CR> ??? It means hit enter key
-- noremap ???? It wont get remapped 
-- silent ??? wont get any feedback in the terminal
--variable to make writing faster
local keymap = vim.keymap

-- YANK COPY PASTE
-- remap copy (saving to + register) (" indicates register)
-- issue <<adds a trailing space>>
-- VIM HIGHLIGHTED YANK PLUGIN
-- will highlight text you yank to give visual confirm it succeeded
-- :%y+ will copy the entire file 
vim.keymap.set('v', '<leader><right>', '"+y')

-- using x key to delete DOES NOT add put in register
keymap.set("n", "x", '"_x')

-- to UN HIGHLIGHT PRESS space<<leader>> then hh
-- think hh == hide highlights
keymap.set("n", "<leader>hh", ":nohl<CR>")


-- REMAP arrow keys to scrolling keys 
-- left and right are big scrolls
-- up and down are small scrolls
-- using shift key with arrows goes down half a page
vim.keymap.set("n", "<Down>", "<C-e>")
vim.keymap.set("n", "<Up>", "<C-y>")
vim.keymap.set("n", "<right>", "<C-f>zz")
vim.keymap.set("n", "<left>", "<C-b>zz")
vim.keymap.set("n", "<S-left>", "<C-u>zz")
vim.keymap.set("n", "<S-right>", "<C-d>zz")


-- make relative line numbers
-- current line will only show absolute line number 
-- easier when using j and k motions to find exact line
vim.o.relativenumber = true
vim.o.number = true

-- tabs and indentation 
-- tabstop : every tab hit will insert TWO spaces
-- shiftwidth : number of spaces used at each level of indent
-- expandtab : replace tab chars with spaces from shiftwidth settin
-- autoindent : adjusts new line based on indent of previous line
-- softtabstop : number of spaces in insert mode for a tab hit
-- smartindent : adjust indent of new line based on previous one
-- !!! if smart no good can try cindent
vim.o.tabstop = 2 
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.softtabstop = 2
vim.o.smartindent = true


-- line wrapping 
--code that extends beyond edge of view will be wrapped to next line
vim.o.wrap = true
vim.o.linebreak = true

-- search settings
-- if you type lower case will match both 
-- but uppercase will match ONLY uppercase
--inc search :: as youre typing search will begin highlighting
vim.o.ignorecase = true
vim.o.smartcase = true 
vim.o.incsearch = true 

-- MOUSE
-- only active in "v" visual mode
vim.o.mouse = "v"

-- variable make it easier to write out many options
-- same as vim.o it seems
local opt = vim.opt 

-- when you delete or change a word it will include the -
-- opt.iskeyword:append("-")

-- clipboard


-- SPLIT WINDOWS
keymap.set("n", "<leader>sv", "<C-w>v") --split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") --split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") --make windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") --close current split window
keymap.set("n", "<leader>0", "<C-w>l") --  >> move to right 
keymap.set("n", "<leader>9", "<C-w>h") --  >> move to left window
keymap.set("n", "<leader>j", "<C-w>j") --  >> move down a window
keymap.set("n", "<leader>k", "<C-w>k") --  >> move up a window

-- TABS IN NVIM (think firefox/chrome tabs)
keymap.set("n", "<leader>to", ":tabnew<CR>") --open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- ADD LINE WITHOUT GOING INTO INSERT MODE
keymap.set("n", "<leader>o", "o<Esc>0")
keymap.set("n", "<leader>O", "O<Esc>0")

-- ADD LINE UNDER COMMENT IN INSERT MODE (NO COMMENT MODE)
keymap.set("n", "<leader>co", "o<Esc>0xxi")

-- put line under cursor position
opt.cursorline = true

-- NVIM TREE
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true})

-- Appearance
vim.o.termguicolors = true
-- allows full color support in terminal
-- required by many plugins
vim.o.colorcolumn = '100'
-- VISUALLY DRAWS ARBITRARY LINE indicating VISUALLY how wide code should be 
--allows highlight a column or range of columns in editor
vim.o.signcolumn = "yes"
-- will keep a gutter and the necessary space available
-- so these two options maintain width of the text
vim.o.scrolloff = 10
-- when searching up and down the screen 
-- if it gets within 10 lines of the bottom it will begin scrolling
-- basically doesnt allow text to be bottom of the screen
vim.o.completeopt = "menuone,noinsert,noselect"
--menuone will show if there is only one item in the completion menu
--think vscode popup suggestions
--no insert means nothing will be inserted by default
--no select means nothing will be selected by default

--BUFFERS LUALINE 
--CTRL JIA o
--CTRL JIA i 
--both of these will switch between the two buffers 

-- Behaviour
vim.o.hidden = true 
--can change buffers wihtout saving
vim.o.errorbells = false
-- no noise when you make an error
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = vim.fn.expand("~/.vim/undodir")
--history of undo changes under this dir ^^
vim.o.backspace = "indent,eol,start"
-- indent >> backspace key will remove auto indent feature
--  if you're indented on new line and press backspace, it will 
--  decrease indent level 
--  eol >> allows backspace to move to previous line 
--  if cursor is at the beginning of current line 
--  start >> move to end of previous line when at beginning of file
--  im guessing move to a different file ?? when at start of file??
vim.o.modifiable = true
-- buffer can be changed or edited.  
vim.o.encoding = "UTF-8"
vim.o.clipboard = "unnamedplus"

--COMMENTS
--to add a comment type gcc 
--see comment.nvim in lua/plugins folder

--Indenting 
--indents in visual mode 
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

--move selected lines up or down with alt key
keymap.set('n', '<A-k>', ':m .-2<cr>==')
keymap.set('n', '<A-j>', ':m .+1<cr>==')

-- VIM ILLUMINATE PLUGIN
-- use alt + n or alt + p to move through instances of
-- search result that is highlighted

--Open lazy plugin manager
--think 1 looks like L or first thing that comes
keymap.set('n', '<leader>1', ':Lazy<CR>')

-- TREESITTER NODE SHORTCUT
--
--Select bigger and bigger chunks of code going outward 
--see ~/.config/nvim/lua/plugins/treesitter.lua
--press <C-x> control x 

keymap.set('n', '<leader>n', ':InspectTree<CR>')
-- opens a syntax tree for the current file
--can see all the nodes in the document 
--type :InspectTree

-- VISUAL LINE INDENTATION MAKING INDENTS EASIER TO SEE
--  will insert a | for every two spaces of indent 
vim.opt.list = true
vim.opt.listchars = { tab = "   ", leadmultispace = '| ' }


