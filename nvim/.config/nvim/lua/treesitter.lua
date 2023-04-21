require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	highlight = {
		enable = true,
	},
	playground = { enable = true },
	textobjects = {
		select = {
			enable = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["ia"] = "@attribute.inner",
				["aa"] = "@attribute.outer",
				["ic"] = "@comment.inner",
				["ac"] = "@comment.outer",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["am"] = "@class.outer",
				["im"] = "@class.inner",
				["ib"] = "@block.inner",
				["ab"] = "@block.outer",
			},
		},
		move = {
			enable = true,
			set_jumps = false,
			goto_next_start = {
				["]]"] = "@function.outer",
			},
			goto_next_end = {
				["]["] = "@function.outer",
			},
			goto_previous_start = {
				["[["] = "@function.outer",
			},
			goto_previous_end = {
				["[]"] = "@function.outer",
			},
		},
	},
})
