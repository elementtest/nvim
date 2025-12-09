-- when you type { ( etc will automatically add >>> ) }
return     {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        -- automatically call plugin setup() function with no arguments
        config = true
    }
