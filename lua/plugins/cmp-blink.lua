return {
	"saghen/blink.cmp",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			dependencies = { "rafamadriz/friendly-snippets" }, -- ← move it here
		},
	},

	version = "1.*",
	init = function()
		-- lua works
    require("luasnip.loaders.from_vscode").lazy_load() -- ← add this (friendly-snippets)
		require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/snippets" })
		-- vs code style works
		require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/snippets" })

		-- LUASNIP keybindings
    -- Tab to jump through fields (i.e. a function)
		vim.keymap.set({ "i", "s" }, "<Tab>", function()
			if require("luasnip").jumpable(1) then
				require("luasnip").jump(1)
			else
				return "<Tab>"
			end
		end, { expr = true, silent = true })

    -- Shift + tab to go back through fields
		vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
			if require("luasnip").jumpable(-1) then
				require("luasnip").jump(-1)
			end
		end, { silent = true })

    -- choice node selection i.e. in css control + l will go through the choices
		vim.keymap.set({ "i", "s" }, "<C-l>", function()
			if require("luasnip").choice_active() then
				require("luasnip").change_choice(1)
			end
		end)
		-- TEST

		-- change color when using signature hep
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				vim.api.nvim_set_hl(
					0,
					"BlinkCmpSignatureHelpActiveParameter",
					{ bg = "#011627", fg = "#00d7af", bold = true }
				)
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

		-- snippets = { preset = "luasnip" },

		-- Enable LuaSnip
		snippets = {
			preset = "luasnip",
			expand = function(snippet)
				require("luasnip").lsp_expand(snippet)
			end,
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			-- when i am in this kind of file, use these  instead
			per_filetype = {
				css = { "lsp", "snippets" },
			},
			providers = {
				path = {
					-- hidden files show up in auto completion
					opts = { show_hidden_files_by_default = true },
				},
				lsp = {
					-- Do not pop up auto complete for single digits
					-- like typing [1,2,3] won't pop up weird completions
					-- min_keyword_length = 2,
				},
			},
		},
		-- use rust for fuzzy matching and notify me if it is not available
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
}
