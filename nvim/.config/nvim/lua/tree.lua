require("nvim-tree").setup({
	view = {
		side = "right"
	},
	git = {
		ignore = false
	},
})

vim.keymap.set("n", "<leader>e", ":NvimTreeFindFile<cr>")
vim.keymap.set("n", "<leader>E", ":NvimTreeToggle<cr>")
