local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	[[   _____   _                        _            _____                               _     _              _____                               _     _         _           ______               _    ]],
	[[  / ____| | |                      (_)          / ____|                             | |   | |      _     / ____|                             | |   | |       (_)         |  ____|             | |   ]],
	[[ | (___   | |   ___   __      __    _   ___    | (___    _ __ ___     ___     ___   | |_  | |__   (_)   | (___    _ __ ___     ___     ___   | |_  | |__      _   ___    | |__    __ _   ___  | |_  ]],
	[[  \___ \  | |  / _ \  \ \ /\ / /   | | / __|    \___ \  | '_ ` _ \   / _ \   / _ \  | __| | '_ \         \___ \  | '_ ` _ \   / _ \   / _ \  | __| | '_ \    | | / __|   |  __|  / _` | / __| | __| ]],
	[[  ____) | | | | (_) |  \ V  V /    | | \__ \    ____) | | | | | | | | (_) | | (_) | | |_  | | | |  _     ____) | | | | | | | | (_) | | (_) | | |_  | | | |   | | \__ \   | |    | (_| | \__ \ | |_  ]],
	[[ |_____/  |_|  \___/    \_/\_/     |_| |___/   |_____/  |_| |_| |_|  \___/   \___/   \__| |_| |_| ( )   |_____/  |_| |_| |_|  \___/   \___/   \__| |_| |_|   |_| |___/   |_|     \__,_| |___/  \__| ]],
	[[                                                                                                  |/                                                                                                ]],
}
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("v", "  VimWiki", ":VimwikiIndex <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
