return {
    -- *************** WHAT THIS IS *********************
    -- CMP is a completion engine 
    -- responsible for showing entries that you want to autocomplete
    -- responsible for the little menu that pops up  
    -- it has different sources: two of which are lsps and luasnip
    -- ***************              *********************
    'hrsh7th/nvim-cmp', -- CMP plugin for neovim
    event = 'InsertEnter',
    dependencies = {
        { 'hrsh7th/cmp-nvim-lsp' }, --LSP Source for CMP
        { 'L3MON4D3/LuaSnip' }, --LuaSnip for snippet support
        'hrsh7th/cmp-path', --Auto suggest filesystem paths i.e. /home/elmt etc
        'saadparwaiz1/cmp_luasnip', -- plugin that links Luasnip to CMP
    },
    config = function()
        -- Load nvim-cmp
        local cmp = require('cmp')
        -- Load LuaSnip
        local luasnip = require('luasnip')
        -- Load nvim-autopairs integration
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')

        -- Define snippets
        luasnip.config.setup({})
        luasnip.add_snippets('css', {
            luasnip.snippet('brd', {
                luasnip.text_node('border: solid red 5px;')
            })
        })

        -- Setup nvim-cmp
        cmp.setup({ -- loads nvim-cmp
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body) -- use luasnip to expand snippets
                end,
            },
            window = {
                completion = cmp.config.window.bordered(), -- bordered completion window
                documentation = cmp.config.window.bordered() -- bordered documentation window
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- scroll documentation up
                ['<C-f>'] = cmp.mapping.scroll_docs(4), -- scroll documentation down
                ['<C-Space>'] = cmp.mapping.complete(), -- trigger completion
                ['<C-e>'] = cmp.mapping.abort(), -- abort completion
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- confirm 
                -- MAKE TAB AND SHIFT TAB GO UP AND DOWN CODE SUGGESTIONS IN LSP
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end),
                -- select the previous item
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item() -- select previous item in completion
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback() -- use fallback if completion menu not visible
                    end
                end),
            }),
            -- ----------------- WHERE DOES CMP LOOK FOR COMPLETION -----------------
            -- aka where are the sources cmp is looking at when it populates the 
            -- completion menu
            -- -----------------                                    -----------------
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },      --LSP source
                { name = 'luasnip' },       -- LuaSnip source
                { name = 'path' },          --path source
            }),
        })

        -- bracket completion for lua
        -- ensures brackets are automatically completed after confirming selection
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end
}
