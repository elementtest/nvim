return     {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        -- TS MEANS TREE SITTER
        config = function()
            -- ENABLES THIS IF USING WINDOWS:
            -- require('nvim-treesitter.install').compilers = { 'zig' } 
            require('nvim-treesitter.configs').setup {
                ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query' },
                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,
                -- Automatically install missing parsers when entering buffer
                auto_install = false,
                highlight = {
                    enable = true,
                },

               incremental_selection = {
                    enable = true,
                    keymayps = {
                        init_selection = "gnn",
                        node_incremental = "grn",
                        scope_incremental = "grc",
                        node_decremental = "grm",
                    },
                },

            }
        end
    }
