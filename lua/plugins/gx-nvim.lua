--enable gx key without netrw
-- gx key will open links in a browser
return {
    "chrishrb/gx.nvim",
    keys = { { "gx", "<cmd>Browse<cr>", mode = {"n", "x"}}},
    cmd = { "Browse"},
    dependencies = {"nvim-lua/plenary.nvim"},
    config = true, --default settings 
    submodules = false --not needed submodules are required only for tests 
}

