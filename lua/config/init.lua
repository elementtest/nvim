local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require('config.keymap')
--links the keymap.lua file inside the /lua/config folder


local plugins = "plugins"

local opts = {
	defaults = {
		lazy = true,
    --by default plugins are NOT lazy loaded
	},
	install = {
		colorscheme = { "nightfly" },
	},
	rtp = {
		disabled_plugins = {
      --will install new plugins and do NOT want the default 
      --plugins to conflict with our new ones
			"gzip",
			"matchit",
			"matchparen",
			"netrw",
			"netrwPlugin",
			"tarPlugin",
			"tohtml",
			"tutor",
			"zipPlugin",
		},
	},
	change_detection = {
		notify = true,
	},
}
require("lazy").setup(plugins, opts)
-- IMPORTANT --
-- line above will look in /lua/plugins folder for ALL plugins
-- plugins in that folder stored in seperate files
