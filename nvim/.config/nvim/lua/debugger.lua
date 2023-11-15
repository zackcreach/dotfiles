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
	command = "/opt/homebrew/Cellar/elixir-ls/0.16.0/libexec/debugger.sh", -- debugger.bat for windows
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
