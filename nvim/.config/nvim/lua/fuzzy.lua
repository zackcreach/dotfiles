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
vim.keymap.set("n", "<leader>/", builtins.live_grep)
vim.keymap.set("n", "<leader>fb", builtins.buffers)
vim.keymap.set("n", "<leader>fg", builtins.git_status)
vim.keymap.set("n", "<leader>fs", builtins.git_stash)
vim.keymap.set("n", "<leader>fr", builtins.registers)
vim.keymap.set("n", "<leader>fo", builtins.lsp_document_symbols)
vim.keymap.set("n", "<leader>fi", ":Telescope symbols<CR>")
