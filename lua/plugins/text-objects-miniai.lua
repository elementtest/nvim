return {
	"echasnovski/mini.ai",
	version = false,
	event = "VeryLazy",
	config = function()
		local ai = require("mini.ai")
		ai.setup({
			n_lines = 100,
			custom_textobjects = {
				f = ai.gen_spec.treesitter({
					a = "@function.outer",
					i = "@function.inner",
				}),
				["="] = ai.gen_spec.treesitter({
					a = "@assignment.outer",
					i = "@assignment.rhs",
				}),
				["L"] = ai.gen_spec.treesitter({
					a = "@assignment.outer",
					i = "@assignment.lhs",
				}),
				a = ai.gen_spec.treesitter({
					a = "@parameter.outer",
					i = "@parameter.inner",
				}),
				c = ai.gen_spec.treesitter({
					a = "@conditional.outer",
					i = "@conditional.inner",
				}),
				["-"] = ai.gen_spec.treesitter({
					a = "@value.outer",
					i = "@value.inner",
				}),
				["p"] = ai.gen_spec.treesitter({
					a = "@property.outer",
					i = "@property.inner",
				}),
			},
		})
	end,
}
