local dap = require("dap")
local dapWidgets = require("dap.ui.widgets")

-- debugging
dap.set_log_level("TRACE")

dap.adapters.mix_task = {
	type = "executable",
	command = "/opt/homebrew/Cellar/elixir-ls/0.13.0/libexec/debugger.sh", -- debugger.bat for windows
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
		name = "mix test",
		task = "test",
		taskArgs = { "--trace" },
		request = "launch",
		startApps = true, -- for Phoenix projects
		projectDir = ".",
		requireFiles = {
			"lib/**/*_test.exs",
		},
	},
	{
		type = "mix_task",
		name = "phx.server",
		request = "launch",
		task = "phx.server",
		projectDir = ".",
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

vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "", linehl = "", numhl = "" })

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
	dap.repl.open()
end)
vim.keymap.set("n", "<leader>dl", function()
	dap.run_last()
end)
vim.keymap.set("n", "<leader>dt", function()
	dap.repl.toggle()
end)

vim.keymap.set({ "n", "v" }, "<leader>dh", function()
	require("dap.ui.widgets").hover()
end)
vim.keymap.set({ "n", "v" }, "<leader>dp", function()
	require("dap.ui.widgets").preview()
end)
vim.keymap.set("n", "<leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<leader>ds", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)
