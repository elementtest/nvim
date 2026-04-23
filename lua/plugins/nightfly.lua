-- colorscheme for nvim
return {
	"bluz71/vim-nightfly-colors",
	lazy = false,
	priority = 999,
	config = function()
		vim.cmd("colorscheme nightfly")
		vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpActiveParameter", { bg = "#011627", fg = "#00d7af", bold = true })
	end,
}
