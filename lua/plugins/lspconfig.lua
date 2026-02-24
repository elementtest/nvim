return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp",
	},
	lazy = false,
	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()
    -- custom_attach is just setting keymaps for LSPs
    -- currently empty
		local custom_attach = function(client, bufnr) end
		--=============================================================================================0
		-- █░░ █░█ ▄▀█
		-- █▄▄ █▄█ █▀█
		--=============================================================================================0
    -- LUA LSP --
		vim.lsp.config("lua_ls", {
			cmd = { "lua-language-server" },
			filetypes = { "lua" },
			-- Sets the "workspace" to the directory where any of these files is found.
			root_markers = {
				".luarc.json",
				".luarc.jsonc",
				".luacheckrc",
				".stylua.toml",
				".git",
			},
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					telemetry = { enable = false },
					workspace = {
						checkThirdParth = false,
						library = {
							vim.env.VIMRUNTIME,
						},
					},
				},
			},
		})
		vim.lsp.enable("lua_ls")

    -- JAVASCRIPT/TYPESCRIPT LSP --
		vim.lsp.config("ts_ls", {
			cmd = { "typescript-language-server", "--stdio" },
			filetypes = {
				"typescript",
				"typescriptreact",
				"javascript",
				"javascriptreact",
			},
			root_markers = {
				"package.json",
				"tsconfig.json",
				"jsconfig.json",
				".git",
			},
			on_attach = custom_attach,
			capabilities = capabilities,
		})
		vim.lsp.enable("ts_ls")

    -- EMMET LSP --
		vim.lsp.config("emmet_language_server", {
			filetypes = { "css", "html" },
			on_attach = custom_attach,
			capabilities = capabilities,
		})
		vim.lsp.enable("emmet_language_server")

    -- CSS LSP --
		vim.lsp.config("cssls", {
			filetypes = { "css" },
			on_attach = custom_attach,
			capabilities = capabilities,
		})
		vim.lsp.enable("cssls")

		-- NEW SERVER SETUP (Nvim 0.11+)
		-- 1. Search :h lspconfig-all for the 'SERVER_NAME' (e.g., 'ts_ls' or 'pyright')
		-- 2. Define custom overrides if needed:
		-- vim.lsp.config('SERVER_NAME', {
		--    on_attach = custom_attach,      -- Your personal keymaps
		--    capabilities = capabilities,    -- Features from blink.cmp
		--    -- Copy/Paste specific settings from :h lspconfig-all here
		-- })
		-- 3. Enable the server:
		-- vim.lsp.enable('SERVER_NAME')
	end,
}
