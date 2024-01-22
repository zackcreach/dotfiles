return {
	-- Color theme
	{
		"gbprod/nord.nvim",
		config = function()
			vim.cmd("colorscheme nord")

			-- Dump all highlight groups and links based on theme:
			-- so $VIMRUNTIME/syntax/hitest.vim
			vim.cmd("hi! link NormalFloat Visual")
			vim.cmd("hi! link NvimTreeWindowPicker LeapLabelSecondary")
			vim.cmd("hi! @error guibg=NONE gui=italic")
		end,
	},
	-- Status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
		opts = {
			options = {
				icons_enabled = true,
				theme = "nord",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "filetype" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		},
	},
	{
		"NvChad/nvim-colorizer.lua",
		opts = {
			user_default_options = {
				filetypes = { "*" },
				mode = "virtualtext",
				virtualtext = "■",
				names = false,
				tailwind = true,
			},
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			view = {
				side = "right",
			},
			git = {
				ignore = false,
			},
		},
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
		keys = {
			{ "<leader>e", ":NvimTreeFindFile<cr>" },
			{ "<leader>E", ":NvimTreeToggle<cr>" },
		},
		lazy = true,
	},
	-- Smooth scroll
	"psliwka/vim-smoothie",
	-- Sessions
	{
		"rmagatti/auto-session",
		opts = {
			log_level = "error",
			auto_session_suppress_dirs = { "~/" },
		},
	},
	-- Debugger
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		event = { "VeryLazy" },
		branch = "master",
		dependencies = {
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			local dap = require("dap")
			local dapUi = require("dapui")
			local dapWidgets = require("dap.ui.widgets")

			-- return function(_, opts)
			--   local dap, dapui = require "dap", require "dapui"
			--   dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
			--   dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
			--   dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
			--   dapui.setup(opts)
			-- end

			-- debugging
			dap.set_log_level("TRACE")

			dap.adapters.mix_task = {
				type = "executable",
				command = "/opt/homebrew/Cellar/elixir-ls/0.18.1/libexec/debug_adapter.sh", -- debugger.bat for windows
				args = {},
			}

			dap.adapters.chrome = {
				type = "executable",
				command = "node",
				args = { vim.loop.os_homedir() .. "/.local/share/vscode-chrome-debug/out/src/chromeDebug.js" },
			}

			dap.configurations.elixir = {
				{
					type = "mix_task",
					name = "Tests",
					task = "test",
					taskArgs = { "--trace" },
					request = "launch",
					startApps = true, -- for Phoenix projects
					projectDir = ".",
					requireFiles = {
						"lib/**/*_test.exs",
					},
					exitAfterTaskReturns = true,
				},
				{
					type = "mix_task",
					name = "Server",
					request = "launch",
					task = "phx.server",
					projectDir = ".",
					exitAfterTaskReturns = true,
				},
			}

			dap.configurations.typescriptreact = {
				-- Chrome
				{
					type = "chrome",
					request = "attach",
					name = "Chrome",
					program = "${file}",
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
					protocol = "inspector",
					port = 9222,
					webRoot = "${workspaceFolder}",
				},
				-- Jest
				{
					type = "pwa-node",
					request = "launch",
					name = "Debug Jest Tests",
					-- trace = true, -- include debugger info
					runtimeExecutable = "node",
					runtimeArgs = {
						"./node_modules/jest/bin/jest.js",
						"--runInBand",
					},
					rootPath = "${workspaceFolder}",
					cwd = "${workspaceFolder}",
					console = "integratedTerminal",
					internalConsoleOptions = "neverOpen",
				},
				-- Node
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach",
					processId = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
			}

			vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })

			vim.keymap.set("n", "<F5>", function()
				dap.continue()
			end)
			vim.keymap.set("n", "<F10>", function()
				dap.step_over()
			end)
			vim.keymap.set("n", "<F11>", function()
				dap.step_into()
			end)
			vim.keymap.set("n", "<F12>", function()
				dap.step_out()
			end)

			vim.keymap.set("n", "<F4>", function()
				dap.toggle_breakpoint()
			end)

			vim.keymap.set("n", "<leader>dr", function()
				dapUi.setup()
				dapUi.open()
			end)

			vim.keymap.set("n", "<leader>dt", function()
				dapUi.toggle()
			end)
		end,
	},
	-- Tmux
	{
		"christoomey/vim-tmux-navigator",
		init = function()
			vim.g.tmux_navigator_disable_when_zoomed = true
		end,
	},
	-- lazy.nvim
	-- {
	-- 	"rcarriga/nvim-notify",
	-- 	lazy = true,
	-- 	config = function(_self, opts)
	-- 		require("notify").setup(opts)
	-- 		vim.notify = require("notify")
	-- 	end,
	-- 	opts = {
	-- 		timeout = 2500,
	-- 		render = "wrapped-compact",
	-- 		stages = "no_animation",
	-- 		level = vim.log.levels.INFO,
	-- 		top_down = false,
	-- 	},
	-- },
	-- {
	-- 	"folke/noice.nvim",
	-- 	lazy = true,
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		cmdline = {
	-- 			format = {
	-- 				cmdline = { pattern = "^:", icon = "λ", lang = "vim" },
	-- 				search_down = { kind = "search", pattern = "^/", icon = "󱎸 ", lang = "regex" },
	-- 				search_up = { kind = "search", pattern = "^%?", icon = "󱈇 ", lang = "regex" },
	-- 			},
	-- 		},
	-- 		lsp = {
	-- 			progress = { enabled = true },
	-- 			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
	-- 			override = {
	-- 				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
	-- 				["vim.lsp.util.stylize_markdown"] = true,
	-- 				["cmp.entry.get_documentation"] = true,
	-- 			},
	-- 		},
	-- 		-- you can enable a preset for easier configuration
	-- 		presets = {
	-- 			bottom_search = true, -- use a classic bottom cmdline for search
	-- 			command_palette = true, -- position the cmdline and popupmenu together
	-- 			long_message_to_split = true, -- long messages will be sent to a split
	-- 			inc_rename = false, -- enables an input dialog for inc-rename.nvim
	-- 			lsp_doc_border = false, -- add a border to hover docs and signature help
	-- 		},
	-- 		messages = {
	-- 			view_search = false,
	-- 		},
	-- 		routes = {
	-- 			{
	-- 				view = "notify",
	-- 				filter = { event = "msg_showmode" },
	-- 			},
	-- 			{
	-- 				filter = {
	-- 					event = "msg_show",
	-- 					any = {
	-- 						{ find = "%d+L, %d+B" },
	-- 						{ find = "; after #%d+" },
	-- 						{ find = "; before #%d+" },
	-- 						{ find = "%d fewer lines" },
	-- 						{ find = "%d more lines" },
	-- 					},
	-- 				},
	-- 				opts = { skip = true },
	-- 			},
	-- 		},
	-- 		views = {
	-- 			cmdline_popup = {
	-- 				position = {
	-- 					row = "10%",
	-- 					col = "50%",
	-- 				},
	-- 				border = {
	-- 					style = "none",
	-- 					padding = { 1, 1 },
	-- 				},
	-- 				filter_options = {},
	-- 				win_options = {
	-- 					winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
	-- 				},
	-- 			},
	-- 		},
	-- 		cmdline = {
	-- 			format = {
	-- 				cmdline = { pattern = "^:", icon = "λ", lang = "vim" },
	-- 				search_down = { kind = "search", pattern = "^/", icon = "󱎸 ", lang = "regex" },
	-- 				search_up = { kind = "search", pattern = "^%?", icon = "󱈇 ", lang = "regex" },
	-- 			},
	-- 		},
	-- 		lsp = {
	-- 			progress = { enabled = true },
	-- 			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
	-- 			override = {
	-- 				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
	-- 				["vim.lsp.util.stylize_markdown"] = true,
	-- 				["cmp.entry.get_documentation"] = true,
	-- 			},
	-- 		},
	-- 		-- you can enable a preset for easier configuration
	-- 		presets = {
	-- 			bottom_search = true, -- use a classic bottom cmdline for search
	-- 			command_palette = true, -- position the cmdline and popupmenu together
	-- 			long_message_to_split = true, -- long messages will be sent to a split
	-- 			inc_rename = false, -- enables an input dialog for inc-rename.nvim
	-- 			lsp_doc_border = false, -- add a border to hover docs and signature help
	-- 		},
	-- 		routes = {
	-- 			{
	-- 				view = "notify",
	-- 				filter = { event = "msg_showmode" },
	-- 			},
	-- 			{
	-- 				filter = {
	-- 					event = "msg_show",
	-- 					any = {
	-- 						{ find = "%d+L, %d+B" },
	-- 						{ find = "; after #%d+" },
	-- 						{ find = "; before #%d+" },
	-- 						{ find = "%d fewer lines" },
	-- 						{ find = "%d more lines" },
	-- 					},
	-- 				},
	-- 				opts = { skip = true },
	-- 			},
	-- 		},
	-- 		views = {
	-- 			cmdline_popup = {
	-- 				position = {
	-- 					row = "10%",
	-- 					col = "50%",
	-- 				},
	-- 				border = {
	-- 					style = "none",
	-- 					padding = { 1, 1 },
	-- 				},
	-- 				filter_options = {},
	-- 				win_options = {
	-- 					winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- 	dependencies = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		"nvim-notify",
	-- 	},
	-- },
}
