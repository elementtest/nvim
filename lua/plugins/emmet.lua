return {
	"mattn/emmet-vim",
  init = function()
    vim.g.user_emmet_leader_key = ','
    -- vim.g.user_emmet_mode = 'nv'
  end,
	keys = {
		{
			"<leader>we",
			"<plug>(emmet-expand-abbr)",
			mode = { "n", "v" },
			desc = "Emmet Wrap",
		},
	},
}
