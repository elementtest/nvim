--live server to see web page changes live run :LiveServer on webpage
return {
    --see keymap for more info
    'aurum77/live-server.nvim',
    build = function()
        require"live_server.util".install()
    end,
            cmd = { "LiveServer", "LiverServerStart", "LiveServerStop"}
        }
