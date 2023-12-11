-- colorscheme for nvim
return {
	"bluz71/vim-nightfly-colors",
  name = "nightfly",
	lazy = false,
	priority = 999,
	config = function()
		vim.cmd('colorscheme nightfly')
	end
}
