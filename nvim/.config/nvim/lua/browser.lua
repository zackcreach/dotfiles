if vim.g.started_by_firenvim then
	-- turn off some visual clutter
	vim.opt.showtabline = 0
	vim.opt.laststatus = 0
	vim.opt.number = false
	vim.opt.relativenumber = false
	vim.opt.guifont = "Liga Roboto Mono:h20"
end

vim.g.firenvim_config = {
	localSettings = {
		[".*"] = {
			takeover = "never",
		},
	},
}
