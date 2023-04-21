local telescope = require("telescope")
local builtins = require("telescope.builtin")

telescope.setup({
	defaults = {
		sorting_strategy = "ascending",
		layout_config = {
			prompt_position = "top",
		},
	},
	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
		},
	},
})

vim.keymap.set("n", "<leader>p", builtins.find_files)
vim.keymap.set("n", "<leader>P", builtins.resume)
vim.keymap.set("n", "<leader>b", builtins.buffers)
vim.keymap.set("n", "<leader>/", builtins.live_grep)
vim.keymap.set("n", "<leader>r", builtins.registers)
