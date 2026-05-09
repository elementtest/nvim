return {
    {
        'ibhagwan/fzf-lua',
        cmd = 'FzfLua',
        keys = {
            {
                '<leader>fb',
                function()
                    local opts = {
                        winopts = {
                            height = 0.6,
                            width = 0.5,
                            preview = { vertical = 'up:70%' },
                            treesitter = {
                                enabled = false,
                                fzf_colors = { ['fg'] = { 'fg', 'CursorLine' }, ['bg'] = { 'bg', 'Normal' } },
                            },
                        },
                        fzf_opts = {
                            ['--layout'] = 'reverse',
                        },
                    }
                    local mode = vim.api.nvim_get_mode().mode
                    if vim.startswith(mode, 'n') then
                        require('fzf-lua').lgrep_curbuf(opts)
                    else
                        require('fzf-lua').blines(opts)
                    end
                end,
                desc = 'Search current buffer',
                mode = { 'n', 'x' },
            },
            { '<leader>fB', '<cmd>FzfLua buffers<cr>', desc = 'Buffers' },
            { '<leader>fc', '<cmd>FzfLua highlights<cr>', desc = 'Highlights' },
            { '<leader>fd', '<cmd>FzfLua lsp_document_diagnostics<cr>', desc = 'Document diagnostics' },
            { '<leader>ff', '<cmd>FzfLua files<cr>', desc = 'Find files' },
            { '<leader>fg', '<cmd>FzfLua live_grep<cr>', desc = 'Grep' },
            { '<leader>fg', '<cmd>FzfLua grep_visual<cr>', desc = 'Grep', mode = 'x' },
            { '<leader>fh', '<cmd>FzfLua help_tags<cr>', desc = 'Help' },
            { '<leader>fr', '<cmd>FzfLua oldfiles<cr>', desc = 'Recently opened files' },
            -- { '<leader>f<', '<cmd>FzfLua resume<cr>', desc = 'Resume last fzf command' },
            { 'z=', '<cmd>FzfLua spell_suggest<cr>', desc = 'Spelling suggestions' },
            {
                '<C-x><C-f>',
                function()
                    require('fzf-lua').complete_path {
                        winopts = {
                            height = 0.4,
                            width = 0.5,
                            relative = 'cursor',
                        },
                    }
                end,
                desc = 'Fuzzy complete path',
                mode = 'i',
            },
        },
    },
}
