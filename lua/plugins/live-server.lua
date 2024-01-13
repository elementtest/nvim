return {
    --live server to see web page changes live 
    --see keymap for more info
    'aurum77/live-server.nvim',
    config = function()
        require"live_server.util".install()
    end,
    cmd = { "LiveServer", "LiverServerStart", "LiveServerStop"}
}
