return {
	"mattn/emmet-vim",
	ft = { "html" },
	init = function()
		vim.g.user_emmet_leader_key = ","
		-- vim.g.user_emmet_mode = 'nv'
	end,
	keys = {
		{
			"<leader>we",
			"<plug>(emmet-expand-abbr)",
			mode = { "v" },
			desc = "Emmet Wrap",
		},
		{
			"<C-j>", -- or whatever key you want
			"<plug>(emmet-move-next)",
			mode = { "i" },
			desc = "Emmet next edit point",
		},
	},
}
