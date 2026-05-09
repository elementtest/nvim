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
            -- search across current buffers
            { '<leader>fB', '<cmd>FzfLua buffers<cr>', desc = 'Buffers' },
            -- colorscheme customization
            -- { '<leader>fc', '<cmd>FzfLua highlights<cr>', desc = 'Highlights' },
            --show list of ALL diagnostics
            { '<leader>fd', '<cmd>FzfLua lsp_document_diagnostics<cr>', desc = 'Document diagnostics' },
            -- search for a book title in library
            { '<leader>ff', '<cmd>FzfLua files<cr>', desc = 'Find files' },
            -- live grep search for sentence in all books in the library
            { '<leader>fg', '<cmd>FzfLua live_grep<cr>', desc = 'Grep' },
            -- live grep (visual mode) will auto paste into search box
            { '<leader>fg', '<cmd>FzfLua grep_visual<cr>', desc = 'Grep', mode = 'x' },
            -- neovim help docs (easier)
            { '<leader>fh', '<cmd>FzfLua help_tags<cr>', desc = 'Help' },
            -- search every file you've opened (useful)
            { '<leader>fr', '<cmd>FzfLua oldfiles<cr>', desc = 'Recently opened files' },
            -- { '<leader>f<', '<cmd>FzfLua resume<cr>', desc = 'Resume last fzf command' },
            -- Spell check (i.e. put on word and hit z=) better ui with fzf
            -- { 'z=', '<cmd>FzfLua spell_suggest<cr>', desc = 'Spelling suggestions' },
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
    opts = function()
    return {
        oldfiles = {
            include_current_session = true,
        }
    }
end,
  },
}
