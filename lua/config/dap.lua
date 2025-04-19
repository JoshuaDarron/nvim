-- ╭────────────────────────────────────────────────────────────╮
-- │                     🔧 DAP CONFIGURATION                   │
-- │               Debug Adapter Protocol Setup                 │
-- ╰────────────────────────────────────────────────────────────╯
local dap = require("dap")
local dapui = require("dapui")

-- ╭─────────────────────────────╮
-- │ 🖼️  UI + Virtual Text Setup │
-- ╰─────────────────────────────╯
dapui.setup()
require("nvim-dap-virtual-text").setup()

dap.listeners.before.launch.dapui_config = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

-- ╭─────────────────────────╮
-- │ 🎯 Debugger Keybindings │
-- ╰─────────────────────────╯
vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F10>", dap.step_over)
vim.keymap.set("n", "<F11>", dap.step_into)
vim.keymap.set("n", "<F12>", dap.step_out)
vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<Leader>B", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "DAP: Toggle REPL" })
vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "DAP: Toggle UI" })

-- ╭───────────────────────────────╮
-- │ 🟨 JavaScript / TypeScript    │
-- │ Adapter: vscode-node-debug2   │
-- ╰───────────────────────────────╯
dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = {
		vim.fn.stdpath("data") .. "/dap_adapters/vscode-node-debug2/out/src/nodeDebug.js"
	},
    options = {
		detached = false,
	}
}

dap.configurations.javascript = {
	{
		type = "node2",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
	{
		name = "Platform:Server - Debug",
		type = "node2",
		request = "launch",
		program = "${workspaceFolder}/app/server/webserver.ts",
		cwd = "${workspaceFolder}/build/aparavi/debug/app",
		args = {
			"--moduleType=platform",
			"--debug=init",
			"--config.database.user=root",
			"--config.database.dialect=mysql",
			"--config.database.password=password",
		},
		outFiles = { "${workspaceFolder}/build/aparavi/debug/app/**/*.js" },
        console = "integratedTerminal",
		skipFiles = {
			"${workspaceFolder}/node_modules/**/*.js",
			"<node_internals>/**/*.js",
		},
	},
	{
		name = "AppAgt:Alpha - Debug",
		type = "node2",
		request = "launch",
		program = "${workspaceFolder}/app/server/webserver.ts",
		cwd = "${workspaceFolder}/build/aparavi/debug/app",
		args = {
			"--moduleType=appagt",
			"--debug=init,task",
			"--engine.keepInput",
			"--config.database.user=root",
			"--config.database.dialect=mysql",
			"--config.database.password=password",
			"--config.database.database=shuas-windows-hybrid-alpha",
			"--config.node.parentObjectId=CLIENTS",
			"--config.node.nodeName=shuas-windows-hybrid-alpha",
		},
		outFiles = { "${workspaceFolder}/build/aparavi/debug/app/**/*.js" },
        console = "integratedTerminal",
		skipFiles = {
			"${workspaceFolder}/node_modules/**/*.js",
			"<node_internals>/**/*.js",
		},
	},
	{
		name = "Jest:Tests - Current File",
		type = "node2",
		request = "launch",
		program = "${workspaceFolder}/node_modules/.bin/jest",
		args = {
			"--config=${workspaceFolder}/tests/jest.config.js",
			"${fileBasenameNoExtension}",
		},
        console = "integratedTerminal",
		sourceMaps = true,
		windows = {
			program = "${workspaceFolder}/node_modules/jest/bin/jest",
		},
	},
	{
		name = "Gulp:Build - Debug",
		type = "node2",
		request = "launch",
		program = "${workspaceFolder}/node_modules/gulp/bin/gulp.js",
		args = { "--build-only" },
	},
	{
		name = "Attach to Process",
		type = "node2",
		request = "attach",
		processId = require("dap.utils").pick_process,
	},
}

dap.configurations.typescript = dap.configurations.javascript

-- ╭───────────────────────╮
-- │ 🐍 Python Debug Setup │
-- ╰───────────────────────╯
dap.adapters.python = {
	type = "executable",
	command = "python",
	args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		pythonPath = function()
			return "python"
		end,
	},
}

-- ╭────────────────────────────╮
-- │ 🧠 C/C++ Debug via cppdbg  │
-- │ Adapter: VSCode cpptools   │
-- ╰────────────────────────────╯
dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = os.getenv("USERPROFILE") .. "\\dap_adapters\\cpptools\\extension\\debugAdapters\\bin\\OpenDebugAD7.exe"
}

dap.configurations.cpp = {
	{
		name = "Launch C++ Executable",
		type = "cppdbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to exe: ", vim.fn.getcwd() .. "\\", "file")
		end,
		cwd = "${workspaceFolder}",
		stopAtEntry = true,
		setupCommands = {
			{
				description = "Enable pretty-printing for gdb",
				text = "-enable-pretty-printing",
				ignoreFailures = false
			}
		},
	}
}
dap.configurations.c = dap.configurations.cpp

