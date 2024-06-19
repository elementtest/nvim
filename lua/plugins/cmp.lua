return     {
    -- *************** WHAT THIS IS *********************
    -- CMP is a completion engine 
    -- responsible for showing entries that you want to autocomplete
    -- responsible for the little menu that pops up  
    -- it has different sources:  two of which are lsps and luasnip
    -- ***************              *********************
    'hrsh7th/nvim-cmp',
    --config set to trigger on insertenter (activates when you enter insert mode)
    event = 'InsertEnter',
    dependencies = {
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'L3MON4D3/LuaSnip' },
        -- Other:
        -- cmp-path = auto suggests filesystem paths i.e. /home/elmt etc
        'hrsh7th/cmp-path',
    },
    config = function()
        -- loads nvim-cmp
        local cmp = require('cmp')
        -- loads nvim-autopairs integration for automatic bracket pairing 
        local cmp_ap = require('nvim-autopairs.completion.cmp')
        -- loads luasnip
        local luasnip = require('luasnip')
        -- initializes luasnip with default settings
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
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                -- MAKE TAB AND SHIFT TAB GO UP AND DOWN CODE SUGGESTIONS IN LSP
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
            }),
            -- ----------------- WHERE DOES CMP LOOK FOR COMPLETION -----------------
            -- aka where are the sources cmp is looking at when it populates the 
            -- completion menu
            -- -----------------                                    -----------------
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'path' },
            }),
        })
        -- bracket completion for lua
        -- ensures brackets are automatically completed after confirming selection
        cmp.event:on(
        'confirm_done',
        cmp_ap.on_confirm_done()
        )
    end
}
