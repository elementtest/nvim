return     {
        'neovim/nvim-lspconfig',
        lazy = false,
        config = function()
            local lspconfig = require('lspconfig')
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
            local custom_attach = function(client, bufnr)
                print('Lsp Attached.')
            end
            --0=============================================================================================0
            -- █░░ █░█ ▄▀█
            -- █▄▄ █▄█ █▀█
            --0=============================================================================================0
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
              on_attach = custom_attach,
              capabilities = capabilities,
              filetypes = {
                "typescript",
                "typescriptreact",
                "javascript",
                "javascriptreact",
              }
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
