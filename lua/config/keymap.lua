-- set spacebar as mapleader key
--<<<<VARIABLES>>>>>
vim.g.mapleader = " "
--variable to make writing faster
local keymap = vim.keymap
-- variable make it easier to write out many options
local opt = vim.opt
-- <CR> enter key
-- noremap ???? It wont get remapped 
-- silent ??? wont get any feedback in the terminal


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
-- when cursor on a word(not /search) it highlight ALL instance of word
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

-- LSP (popup code suggestion) (configured in cmp.lua file)
-- z + leader will abort the suggestion !(might cause problems)
-- enter key will complete the suggeestion

-- LIVE SERVER 
-- run live-server from terminal to start
-- or open up folder with vim . 
-- then :LiveServer to start it
-- LiveServerStart or LiveServerStop will do accordingly
-- edited bash rc file "live" alias to launch it

-- SURROUND NVIM
-- surround text with [] {} '' etc 
-- begins with You Surround i.e. ysiw ysa" ysl* yst]' etc 
-- can also Delet Surround i.e. ds( ds" etc 
-- :h nvim-surround.usage for help

--<<<<KEYMAPS>>>>--

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


-- display file path and file name at VERY top of terminal
vim.o.title = true


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

-- make relative line numbers
-- current line will only show absolute line number 
-- easier when using j and k motions to find exact line
vim.o.relativenumber = true
vim.o.number = true

-- VISUAL LINE INDENTATION MAKING INDENTS EASIER TO SEE
-- list enables special characters to be displayed
-- listchars will insert a | for every two spaces of indent 
-- showmatch will highlight matching {[""]} when put over it
vim.opt.list = true
vim.opt.listchars = { tab = "  ", leadmultispace = '│   ' }
vim.opt.showmatch = true



-- NEOVIM startup intro screen 
-- vim.opt.shortmess:append({ I = true })
-- suppresses intro screen message 
-- use :intro to open 

-- tabs and indentation 
-- tabstop : every tab hit will insert TWO spaces
-- shiftwidth : number of spaces used at each level of indent
-- expandtab : replace tab chars with spaces from shiftwidth setting
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

-- put line under cursor position
opt.cursorline = true

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

-- TIMEOUT 
-- ie when hit leader key how long do you have to press next key
-- see above... how long will it "listen" for the space key after
-- the 8 or 9 is hit
vim.opt.timeoutlen = 350

-- <<<<<<<REMAPS>>>>>>>
-- when you delete or change a word it will include the -
-- opt.iskeyword:append("-")

-- using x key to delete DOES NOT add put in register
keymap.set("n", "x", '"_x')

-- unhighlight search AND switch windows
keymap.set("n", "<Tab>", "<Cmd>nohlsearch<CR><C-W>w")


-- REMAP arrow keys to scrolling keys 
-- left and right are big scrolls
-- up and down are small scrolls
-- using shift key with arrows goes down half a page
keymap.set("n", "<Down>", "<C-e>")
keymap.set("n", "<Up>", "<C-y>")
keymap.set("n", "<right>", "<C-f>zz")
keymap.set("n", "<left>", "<C-b>zz")
keymap.set("n", "<S-left>", "<C-u>zz")
keymap.set("n", "<S-right>", "<C-d>zz")


-- SPLIT WINDOWS
keymap.set("n", "<leader>sv", "<C-w>v") --split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") --split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") --make windows equal width
keymap.set("n", "<leader>sc", ":close<CR>") --close split window
keymap.set("n", "<leader>0", "<C-w>l") --  >> move to right 
keymap.set("n", "<leader>9", "<C-w>h") --  >> move to left window
keymap.set("n", "<leader>j", "<C-w>j") --  >> move down a window
keymap.set("n", "<leader>k", "<C-w>k") --  >> move up a window


-- ADD LINE WITHOUT GOING INTO INSERT MODE
keymap.set("n", "<leader>o", "o<Esc>0")

-- ADD LINE UNDER COMMENT IN INSERT MODE (NO COMMENT MODE)
keymap.set("n", "<leader>c", "<down>O")

--JUMP TO END OF LINE IN INSERT MODE and add ; SAVE and new line
keymap.set("i", "9<leader>", "<Esc>A;<Esc>:w<CR>")

-- skip forward one or two lines in insert mode
-- i.e. jump cursor out of [] when stuck inside
keymap.set('i', 'z<leader>', '<right>')

-- NVIM TREE
-- opens file explorer on left
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>",
{ noremap = true, silent = true})

--Indent>
--indents in normal mode 
keymap.set("n", "<", "<gv")
keymap.set("n", ">", ">gv")

--move selected lines up or down with alt key
keymap.set('n', '<A-k>', ':m .-2<cr>==')
keymap.set('n', '<A-j>', ':m .+1<cr>==')


--Open lazy plugin manager
--think 1 looks like L or first thing that comes
keymap.set('n', '<leader>1', ':Lazy<CR>')

keymap.set('n', '<leader>n', ':InspectTree<CR>')
-- opens a syntax tree for the current file
--can see all the nodes in the document 
--type :InspectTree

-- EXIT NEOVIM SHIFT ZZ SHORTCUT!
-- if nothing exits
-- if buffer configured prompts if user wants save
keymap.set("n", "<leader>q", ":confirm qall<CR>")


-- BLOCK MOVE LINES UP OR DOWN (visual mode)
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- move lines down (Cap J)
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- move lines down (Cap K)


--allow search terms to stay in the middle 
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

--cursor remains in same place append LINE BELOW TO CURRENT LINE
keymap.set('n', 'J', 'mzJ`z')

-- paste into highlighted word and repeat without problems
-- use yiw to yank word / whatever then viw to highlight then use
keymap.set('x', '<leader>p', "\"_dP")

--selects system clipboard register
--THEN can put stuff inside it.  i.e. ap (around paragraph)
keymap.set('n', '<leader>y', "\"+y")
keymap.set('v', '<leader>y', "\"+y")
keymap.set('n', '<leader>y', "\"+y")

-- LSP opens a hover box with information about code
keymap.set('n', 'K', vim.lsp.buf.hover)

-- Select entire document and format indents with = 
keymap.set('n', '<leader>g', 'ggVG=')

-- quick save :w
keymap.set('n', '<leader>w', ':w<CR>')
