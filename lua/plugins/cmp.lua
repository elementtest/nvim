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
        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body) -- use luasnip to expand snippets
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
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'path' },
            }),
        })

        -- Configure autopairs
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end
}
