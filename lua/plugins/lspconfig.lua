return {
        'neovim/nvim-lspconfig',
        lazy = false,
        config = function()
            local lspconfig = require('lspconfig')
            -- two vars below create then enhance capabilities
            -- they are the same variable
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
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
            lspconfig.lua_ls.setup ({
                on_attach = custom_attach,
                -- function that runs AFTER LSP loads in buffer
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            enable = true,
                            -- enable = false,
                        },
                        workspace = {
                            checkThirdParty = false,
                            library = {
                              vim.env.VIMRUNTIME,
                            },
                        },
                        telemetry = { enable = false },
                    },
                },
            })
            lspconfig.tsserver.setup ({
            --0=============================================================================================0
           --  lspconfig.lua_ls.setup ({
           --      on_attach = custom_attach,
           --      -- function that runs AFTER LSP loads in buffer
           --      capabilities = capabilities,
           --      settings = {
           --          Lua = {
           --              runtime = {
           --                  version = 'LuaJIT',
           --              },
           --              diagnostics = {
           --                  enable = true,
           --                  -- enable = false,
           --              },
           --              workspace = {
           --                  checkThirdParty = false,
           --                  library = {
           --                    vim.env.VIMRUNTIME,
           --                  },
           --              },
           --              telemetry = { enable = false },
           --          },
           --      },
           -- })
           lspconfig.ts_ls.setup ({
              on_attach = custom_attach,
              capabilities = capabilities,
              filetypes = {
                "typescript",
                "typescriptreact",
                "javascript",
                "javascriptreact",
              }
            })
            lspconfig.emmet_language_server.setup({
                filetypes = {"css", "html"},
                on_attach = custom_attach,
                root_dir = vim.loop.cwd,
                capabilities = capabilities
            })
            lspconfig.cssls.setup({
                filetypes = {"css"},
                on_attach = custom_attach,
                capabilities = capabilities
            })

            -- new server goes here:
            -- lspconfig.SERVER.setup({
            --    on_attach = custom_attach,
            --    capabilities = capabilities
            --    COPY PASTE SERVER SETTINGS HERE
            --})
        --SEE LSP CONFIG DOCUMENTATION TO SEE HOW TO SET UP
        end
    }
