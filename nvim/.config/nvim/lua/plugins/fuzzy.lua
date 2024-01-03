return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"nvim-telescope/telescope-symbols.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local builtins = require("telescope.builtin")

			telescope.setup({
				defaults = {
					sorting_strategy = "ascending",
					layout_config = {
						prompt_position = "top",
					},
					prompt_prefix = "󰱨 ",
				},
				pickers = {
					find_files = {
						find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
					},
					live_grep = {
						vimgrep_arguments = {
							"rg",
							"-g",
							"!.git",
							"--hidden",
							"--color=never",
							"--no-heading",
							"--with-filename",
							"--line-number",
							"--column",
							"--smart-case",
						},
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
		end,
	},
}
