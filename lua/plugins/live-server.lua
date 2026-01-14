-- live server installed to make changes in editor appear instantly in browser
return {
        'barrett-ruth/live-server.nvim',
        build = 'pnpm add -g live-server',
        cmd = { 'LiveServerStart', 'LiveServerStop' },
        opts = {},

    }
