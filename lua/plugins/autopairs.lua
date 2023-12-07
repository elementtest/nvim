-- when you type { ( etc will automatically add >>> ) }
return     {
        'windwp/nvim-autopairs',
        config = function()
            require("nvim-autopairs").setup()
        end
    }

