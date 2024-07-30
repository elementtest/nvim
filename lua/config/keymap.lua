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
--COMMENTS (built in neovim)
--to add a comment type gcc 

-- FONT USED
-- font used is JetBrainsMono Nerd Font Mono
-- GNOME TERMINAL:  font stored in ~/.local/share/fonts
-- POPOS NOTES:  installed nerd font, used install script from Sean Breckenridge
-- for script to work must create folder in ~/bin/patched-fonts
-- in this folder you put the font you want installed on your system
-- after that in ~/.config/alacritty/ you need to open alacritty.yml file
-- then edit it

-- JUMP LIST
-- keeps track of movements in a file 
--CTRL o <<moves back through jump list>>
--CTRL i <<moves forward through jump list>>
--allows navigation between locations 

-- VIM ILLUMINATE PLUGIN
-- when cursor on a word(not /search) it highlight ALL instance of word
-- use alt + n or alt + p to move through instances of
-- search result that is highlighted

-- gx-nvim.lua PLUGIN 
-- use gx to open links inside the browser

-- YANK COPY PASTE
-- remap copy (saving to + register) (" indicates register)
-- issue <<adds a trailing space>>
-- VIM HIGHLIGHTED YANK PLUGIN
-- will highlight text you yank to give visual confirm it succeeded
-- :%y+ will copy the entire file 
--vim.keymap.set('v', '<leader><right>', '"+y')
--right now commenting out.  yy works fine for this purpose 
--!USE BIG Y TO NOT HAVE A TRAILING SPACE COPIED

-- TREESITTER  SHORTCUT
-- (called incremental selection)
-- can be used for other keyboard shortcuts (selecting code sections)
--see ~/.config/nvim/lua/plugins/treesitter.lua
--press <C-x> control x 

-- LSP (popup code suggestion) (configured in cmp.lua file)
-- enter key will complete the suggeestion

-- LIVE SERVER 
-- open up folder with vim . 
-- then :LiveServerStart to start it
-- LiveServerStart or LiveServerStop will do accordingly


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
--  clipboard synchronizes system clipboard with the neovim clipboard 
vim.o.encoding = "UTF-8"
vim.o.clipboard = "unnamedplus"



-- display file path and file name at VERY top of terminal
vim.o.title = true


-- Appearance
-- termguicolors == required by many plugins / terminal color support
-- colorcolumn visually draws arbitrary line (see right) >>>>
-- signcolumn displays "signs" ie breakpoints, git markers, etc
-- !scrolloff # is minimum amount of lines to keep above/below cursor
-- completeopt:
-- menuone display popup menu even if only one match
-- noinsert do not automatically insert the first match
-- !noselect do not automatically select first match 
vim.o.termguicolors = true 
vim.o.colorcolumn = '100'
vim.o.signcolumn = "yes"
vim.o.scrolloff = 999
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




-- tabs and indentation 
-- tabstop : every tab hit will insert FOUR spaces
-- shiftwidth : number of spaces used at each level of indent
-- expandtab : replace tab chars with spaces from shiftwidth setting
-- autoindent : adjusts new line based on indent of previous line
-- softtabstop : number of spaces in insert mode for a tab hit
-- smartindent : adjust indent of new line based on previous one
-- CHANGING ALL 2 NUMBERS TO 4 TO REVERSE CHANGE BACK TO 2
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
-- VISUAL BLOCK MODE (at end of line block will extend BEYOND into nill space)
vim.opt.virtualedit = "block"

-- SHOW PREVIEW OF ALL CHANGES FROM :%s/foo/bar ON BOTTOM OF SCREEN
vim.opt.inccommand = "split"

-- SPLIT windows open on BOTTOM not top
vim.o.splitbelow = true

-- using x key to delete DOES NOT add put in register
keymap.set("n", "x", '"_x')

-- when you delete or change a word it will include the -
opt.iskeyword:append("-")

-- delete in visual mode saves file
keymap.set("v", "d", 'd:w<CR>')

-- hitting delete saves file
keymap.set('n', 'dd', 'dd<Cmd>:w<CR>')

-- UNDO KEY WILL NOW SAVE
keymap.set("n", "u", "u:w<CR>")

-- REDO KEY WILL NOW SAVE
keymap.set('n', '<C-r>', '<C-r>:w<CR>')

-- JUMP TO FIRST NON-WHITE space character nonwhite space
-- GO TO ZEEEE FIRST NON WHITE SPACE CHARACTER
keymap.set('n', 'z', '^')



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
keymap.set('n', '<C-Left>', '<Cmd>vertical resize -2<CR>')
keymap.set('n', '<C-Right>', '<Cmd>vertical resize +2<CR>')


-- first part is un-highlighting search results
-- second part is moves cursor to next window (if multiple open windows)
keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR><C-W>w")

-- ADD LINE / INSERT LINE WITHOUT GOING INTO INSERT MODE
keymap.set("n", "<leader>o", "o<Esc>0")

-- Save in insert mode (Ctrl + w)
keymap.set('i', '<C-s>', '<Esc>:w<CR>a')



-- NODE execute in neovim
keymap.set('n', '<leader>n', '<Cmd>!node %<CR>')



--JUMP TO END OF LINE IN INSERT MODE and add ; SAVE and new line
--USED FOR JAVASCRIPT and CSS
keymap.set("i", "9<leader>", "<Esc>A;<Esc>:w<CR>")
keymap.set("n", "9<leader>", "<Esc>A;<Esc>:w<CR>")


--GO TO END OF LINE in INSERT MODE
keymap.set('i', 'jj', '<Esc><S-a><Cmd>w<CR>')
-- quick save :w WRITE FILE
keymap.set('n', '<C-s>', '<Esc>:w<CR>')

-- skip forward one or two lines in insert mode
-- i.e. jump cursor out of [] when stuck inside
keymap.set('i', 'z<leader>', '<right>')

-- NVIM TREE
-- opens file explorer on left
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>",
{ noremap = true, silent = true})

--Indent>
--indents in normal mode 
keymap.set("n", "<", "<")
keymap.set("n", ">", ">")

--move selected lines up or down with alt key
keymap.set('n', '<A-k>', ':m .-2<cr>==')
keymap.set('n', '<A-j>', ':m .+1<cr>==')


--Open lazy plugin manager
--think 1 looks like L or first thing that comes
keymap.set('n', '<leader>1', ':Lazy<CR>')

keymap.set('n', '<leader>t', ':InspectTree<CR>')
-- opens a syntax tree for the current file
--can see all the nodes in the document 
--type :InspectTree

-- EXIT NEOVIM SHIFT ZZ SHORTCUT!
-- if no buffers are changed then exits neovim 
-- if buffer configured prompts if user wants save
keymap.set("n", "<leader>q", ":confirm qall<CR>")


-- BLOCK MOVE LINES UP OR DOWN (visual mode)
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- move lines down (Cap J)
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- move lines down (Cap K)

-- FORMAT ENTIRE DOCUMENT
-- Select entire document and format indents with = 
-- keymap.set('n', '<leader>g', 'ggVG=<C-o>')
keymap.set('n', '<leader>g', 'ggVG=')



-- BUFFERS 
-- remap PgUp and PgDn keys (Popos system)
-- run nvim * to open up all files in folder
keymap.set('n', '<PageUp>', '<Cmd>bprevious<CR>')
keymap.set('n', '<PageDown>', '<Cmd>bnext<CR>')

-- Stop and Restart Live Server with Delay in between
keymap.set('n', '<leader>h', [[<Cmd>LiveServerStop<CR>:sleep 500m<CR>:LiveServerStart<CR>]])


-- PREVIOUS shortcut configuration (try above first for a while before deleting)
-- LIVE SERVER START
-- keymap.set('n', '<leader>h', '<Cmd>LiveServerStart<CR>')
-- LIVE SERVER STOP
-- keymap.set('n', '<leader>s', '<Cmd>LiveServerStop<CR>')

-- check if LSP enabled
keymap.set('n', '<leader>l', '<Cmd>LspInfo<CR>')

-- basic layout of combining a keymap to a function
-- vim.keymap.set("<mode>", '<key>',
-- function()
-- do something
-- end)

-- remove annoying asterisks generated in .css and .js files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    command = "setlocal formatoptions-=ro"
})

-- Highlight yanked text for 150ms
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end
})
