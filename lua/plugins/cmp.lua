-- completion plugin for neovim 
return     {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
            -- Other:
            'hrsh7th/cmp-path',
        },
        config = function()
            local cmp = require('cmp')
            local cmp_ap = require('nvim-autopairs.completion.cmp')
            local luasnip = require('luasnip')
            luasnip.config.setup {}
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered()
                },
                mapping = cmp.mapping.preset.insert({
                    -- ['<C-j>'] = cmp.mapping.select_next_item(),
                    -- ['<C-k>'] = cmp.mapping.select_prev_item(),
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),

                  -- Select the next item
                ["<Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              else
                fallback()
              end
            end),

                -- Select the previous item
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                    cmp.select_prev_item()
                  else
                    fallback()
                  end
                end),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-e>'] = cmp.mapping.complete(),
                    ['z<leader>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                --order is important
                --determines priority of appear in completion menu
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'path' },
                }),
            })
            -- bracket completion for lua
            cmp.event:on(
                'confirm_done',
                cmp_ap.on_confirm_done()
            )
        end
    }
