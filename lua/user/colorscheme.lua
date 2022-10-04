vim.cmd("colorscheme default")

local colorschemes = { "terafox" }

math.randomseed(os.time())
local rand = math.random(#colorschemes)

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorschemes[rand])

if not status_ok then
	vim.notify("colorscheme " .. colorscheme[rand] .. " not found!")
	return
end
