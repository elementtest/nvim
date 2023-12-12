--MASON:  package manager install manager LSP servers/linters/formatters
return     {
        'williamboman/mason.nvim',
        lazy = false,
        config = function()
            require('mason').setup({
              ui = {
                icons = {           
                  package_installed = "✓",
                  package_pending = "➜",
                  package_uninstalled = "✗"
                }
              }
            })
        end

}
