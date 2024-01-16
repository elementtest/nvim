--live server to see web page changes live run :LiveServer on webpage
return {
    --see keymap for more info
    requires = 'neovim/nvim-lspconfig',
    'aurum77/live-server.nvim',
    build = function()
        require"live_server.util".install()
    end,

    config = function()
            local status_ok, live_server = pcall(require, "live_server")
            if not status_ok then
                print("live server not installed")
                return
            end
        --
        --
            live_server.setup({
                    port = 7567,
                    browser_command = "/opt/firefox/firefox", -- Command or executable path
                    quiet = false,
                    no_css_inject = true,
                    install_path = os.getenv("HOME") .. "/live/",
                })
            end,
            cmd = { "LiveServer", "LiverServerStart", "LiveServerStop"}
        }
