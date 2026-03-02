return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },

	version = "1.*",
	init = function()
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
        vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpActiveParameter", { bg = "#011627", fg = "#00d7af", bold = true })


			end,
		})
		-- Apply it immediately for the current session
		vim.api.nvim_exec_autocmds("ColorScheme", {})
	end,

	opts = {
		-- type ( to trigger to be a cheat sheet for anything that requires arguments i.e. functions
		-- typing ) will close it
		signature = {
			enabled = true,
		},
		keymap = { preset = "default" },

		appearance = {
			nerd_font_variant = "mono",
			use_nvim_cmp_as_default = false,
		},

		completion = {
			accept = {
				-- Stop Blink from adding '()'
				-- we type '(' to manually trigger signature help box reliably
				auto_brackets = { enabled = false },
			},
			-- automatically shows box with documentation i.e. Mozilla MDN
			documentation = { auto_show = true },
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			providers = {
				lsp = {
					-- Do not pop up auto complete for single digits
					-- like typing [1,2,3] won't pop up weird completions
					min_keyword_length = 2,
				},
			},
		},
		-- use rust for fuzzy matching and notify me if it is not available
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
}
