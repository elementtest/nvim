return {
  'neovim/nvim-lspconfig',
  lazy = false,
  config = function()
    local lspconfig = require('lspconfig')
    -- two vars below create then enhance capabilities
    -- they are the same variable
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    local custom_attach = function(client, bufnr)
      --display NVIM version with LSP
      local version_output = vim.fn.system('nvim --version')
      local version_number = string.match(version_output, 'NVIM%s+v(%d+%.%d+%.%d+)')
      -- print message indicatign LSP has been attached.  disabled because annoying
      -- use to debug?
      -- print("<LSP ATTACHED> NVIM: " .. version_number)
    end
    --=============================================================================================0
    -- █░░ █░█ ▄▀█
    -- █▄▄ █▄█ █▀█
    --=============================================================================================0
    vim.lsp.config('lua_ls', {
      cmd = { 'lua-language-server' },
      filetypes = { 'lua' },
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
            version = 'LuaJIT',
          }
        }
      }
    })

    -- Now that the language server is configured, it must be enabled
    vim.lsp.enable('lua_ls')
    vim.lsp.config('ts_ls', {
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

    vim.lsp.enable('ts_ls')


    -- vim.lsp.config.('ts_ls'({
    --   on_attach = custom_attach,
    --   capabilities = capabilities,
    --   filetypes = {
    --     "typescript",
    --     "typescriptreact",
    --     "javascript",
    --     "javascriptreact",
    --   }
    -- })
    vim.lsp.config('emmet_language_server', {
      filetypes = { "css", "html" },
      on_attach = custom_attach,
      capabilities = capabilities,
    })

    vim.lsp.enable('emmet_language_server')

    -- vim.lsp.config.emmet_language_server.setup({
    --   filetypes = { "css", "html" },
    --   on_attach = custom_attach,
    --   root_dir = vim.loop.cwd,
    --   capabilities = capabilities
    -- })
    -- vim.lsp.config.cssls.setup({
    --   filetypes = { "css" },
    --   on_attach = custom_attach,
    --   capabilities = capabilities
    -- })
    vim.lsp.config('cssls', {
      filetypes = { "css" },
      on_attach = custom_attach,
      capabilities = capabilities,
    })

    vim.lsp.enable('cssls')


    -- new server goes here:
    -- vim.lsp.config.SERVER.setup({
    --    on_attach = custom_attach,
    --    capabilities = capabilities
    --    COPY PASTE SERVER SETTINGS HERE
    --})
    --SEE LSP CONFIG DOCUMENTATION TO SEE HOW TO SET UP
  end
}
