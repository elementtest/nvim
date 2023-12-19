-- set spacebar as mapleader key
vim.g.mapleader = " "
-- leader key is spacebar
-- <CR> ??? It means hit enter key
-- noremap ???? It wont get remapped 
-- silent ??? wont get any feedback in the terminal
--variable to make writing faster
local keymap = vim.keymap


-- <<<<NOTES OTHER PLUGINS ETC>>>> --
--COMMENTS
--to add a comment type gcc 
--see comment.nvim in lua/plugins folder

-- FONT USED
-- font used is JetBrainsMono Nerd Font Mono

-- JUMP LIST
-- keeps track of movements in a file 
--CTRL o <<moves back through jump list>>
--CTRL i <<moves forward through jump list>>
--allows navigation between locations 

-- VIM ILLUMINATE PLUGIN
-- when on a word highlights ALL instances of word
-- use alt + n or alt + p to move through instances of
-- search result that is highlighted

-- YANK COPY PASTE
-- remap copy (saving to + register) (" indicates register)
-- issue <<adds a trailing space>>
-- VIM HIGHLIGHTED YANK PLUGIN
-- will highlight text you yank to give visual confirm it succeeded
-- :%y+ will copy the entire file 
--vim.keymap.set('v', '<leader><right>', '"+y')
--right now commenting out.  yy works fine for this purpose 
--!USE BIG Y TO NOT HAVE A TRAILING SPACE COPIED

-- TREESITTER NODE SHORTCUT
-- (called incremental selection)
--Select bigger and bigger chunks of code going outward 
--see ~/.config/nvim/lua/plugins/treesitter.lua
--press <C-x> control x 

--<<<<KEYMAPS>>>>--
-- display file path and file name at VERY top of terminal
vim.o.title = true

-- using x key to delete DOES NOT add put in register
keymap.set("n", "x", '"_x')

-- to UN HIGHLIGHT PRESS space leader then hh
-- think hh == hide highlights
keymap.set("n", "<Tab>", "<Cmd>nohlsearch<CR>")


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
-- TEST CHANGING ALL 2 NUMBERS TO 4 TO REVERSE CHANGE BACK TO 2
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.softtabstop = 4
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



-- SPLIT WINDOWS
keymap.set("n", "<leader>sv", "<C-w>v") --split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") --split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") --make windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") --close current split window
keymap.set("n", "<leader>l", "<C-w>l") --  >> move to right 
keymap.set("n", "<leader>h", "<C-w>h") --  >> move to left window
keymap.set("n", "<leader>j", "<C-w>j") --  >> move down a window
keymap.set("n", "<leader>k", "<C-w>k") --  >> move up a window


-- ADD LINE WITHOUT GOING INTO INSERT MODE
keymap.set("n", "<leader>o", "o<Esc>0")
keymap.set("n", "<leader>O", "O<Esc>0")

-- ADD LINE UNDER COMMENT IN INSERT MODE (NO COMMENT MODE)
keymap.set("n", "<leader>c", "o<Esc>0xxi")

--JUMP TO END OF LINE IN INSERT MODE
keymap.set("i", "<S-Tab>", "<Esc>A")

-- put line under cursor position
opt.cursorline = true


-- NVIM TREE
-- opens file explorer on left
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>",
{ noremap = true, silent = true})

-- Appearance
-- termguicolors == required by many plugins / terminal color support
-- colorcolumn visually draws arbitrary line (see right) >>>>
-- signcolumn displays "signs" ie breakpoints, git markers, etc
-- !scrolloff # is minimum number of lines to keep above/below cursor
-- completeopt:
-- menuone display popup menu even if only one match
-- noinsert do not automatically insert the first match
-- !noselect do not automatically select first match 
vim.o.termguicolors = true
vim.o.colorcolumn = '100'
vim.o.signcolumn = "yes"
vim.o.scrolloff = 10
vim.o.completeopt = "menuone,noinsert,noselect"


-- Behaviour
vim.o.hidden = true 
--can change buffers without saving
vim.o.modifiable = true
-- buffer can be changed or edited.  
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
vim.o.encoding = "UTF-8"
vim.o.clipboard = "unnamedplus"


--Indenting 
--indents in normal mode 
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

--move selected lines up or down with alt key
keymap.set('n', '<A-k>', ':m .-2<cr>==')
keymap.set('n', '<A-j>', ':m .+1<cr>==')

-- BLOCK MOVE LINES UP OR DOWN (visual mode)
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- move lines down (Cap J)
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- move lines down (Cap K)


--Open lazy plugin manager
--think 1 looks like L or first thing that comes
keymap.set('n', '<leader>1', ':Lazy<CR>')


keymap.set('n', '<leader>n', ':InspectTree<CR>')
-- opens a syntax tree for the current file
--can see all the nodes in the document 
--type :InspectTree

-- VISUAL LINE INDENTATION MAKING INDENTS EASIER TO SEE
-- list enables special characters to be displayed
-- listchars will insert a | for every two spaces of indent 
-- showmatch will highlight matching {[""]} when hovered over it
vim.opt.list = true
vim.opt.listchars = { tab = "  ", leadmultispace = '│   ' }
vim.opt.showmatch = true



-- NEOVIM intro screen 
vim.opt.shortmess:append({ I = true })
-- suppresses intro screen message 
-- use :intro to open 



-- EXIT NEOVIM SHIFT ZZ SHORTCUT!
-- if nothing exits
-- if buffer configured prompts if user wants save
keymap.set("n", "<leader>q", ":confirm qall<CR>")

-- skip forward one or two lines in insert mode
keymap.set('i', '8<space>', '<right>')
keymap.set('i', '9<space>', '<right><right>')

-- TIMEOUT 
-- ie when hit leader key how long do you have to press next key
-- see above... how long will it "listen" for the space key after
-- the 8 or 9 is hit
vim.opt.timeoutlen = 300

