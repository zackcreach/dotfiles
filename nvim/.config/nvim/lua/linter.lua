local lint = require("lint")

lint.linters_by_ft = {
	elixir = { "credo" },
}

local group = vim.api.nvim_create_augroup("MyLinter", {})

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
	pattern = { "*.ex", "*.exs" },
	callback = function()
		lint.try_lint()
	end,
	group = group,
})
