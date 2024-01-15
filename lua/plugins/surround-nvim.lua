-- surround different text you choose with [] ''{} etc 
-- :h nvim-surround.usage for help
return {
    "kylechui/nvim-surround",
    version = "*", -- use for stability; omite to use 'main'
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            --configuration here or leave empty to use defaults
        })
    end
}
