return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    lazy = false,
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query' },
            sync_install = false,
            auto_install = false,
            highlight = {
                enable = true,          -- enable Treesitter highlighting
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm",
                },
            },
        }
    end
}

