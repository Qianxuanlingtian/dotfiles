-- 这是一个使得Neovim可以进行debug的插件
return{
	{
		"mfussenegger/nvim-dap",
		event = 'VeryLazy',
		config = function ()
		end
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio"
		},
		opts = {},
		config = function (_, opts)
			require("dapui").setup(opts)
			-- UI responsiveness
			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			-- Custom breakpoint icons
			vim.fn.sign_define('DapBreakpoint', { text = '⬣', texthl = 'DapBreakpoint', linehl = '', numhl = 'DapBreakpoint' })
			vim.fn.sign_define(
				'DapBreakpointCondition',
				{ text = '⬣', texthl = 'DapBreakpointCondition', linehl = 'DapBreakpointCondition', numhl = 'DapBreakpointCondition' }
			)
			vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })
			
			-- DAPUI debug调试快捷键
			vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "DAP: Toggle UI" })
			vim.keymap.set("n", "<leader>ds", dap.continue, { desc = " Start/Continue" })
			vim.keymap.set("n", "<leader>di", dap.step_into, { desc = " Step into" })
			vim.keymap.set("n", "<leader>do", dap.step_over, { desc = " Step over" })
			vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = " Step out" })
			vim.keymap.set("n", "<leader>dq", dap.close, { desc = "DAP: Close session" })
			vim.keymap.set("n", "<leader>dQ", dap.terminate, { desc = " Terminate session" })
			vim.keymap.set("n", "<leader>dr", dap.restart_frame, { desc = "DAP: Restart" })

			vim.keymap.set("n", "<leader>dc", dap.run_to_cursor, { desc = "DAP: Run to Cursor" })
			vim.keymap.set("n", "<leader>dR", dap.repl.toggle, { desc = "DAP: toggle REPL" })
			vim.keymap.set("n", "<leader>dh", require('dap.ui.widgets').hover, { desc = "DAP: Hover" })

			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Breakpoint" })
			vim.keymap.set("n", "<leader>dB", function()
				local input = vim.fn.input 'Condition for breakpoint:'
				dap.set_breakpoint(input)
			end, { desc = "DAP: Conditional Breakpoint" })
			vim.keymap.set("n", "<leader>dD", dap.clear_breakpoints, { desc = "DAP: Clear Breakpoints" })
		end
	},
	{
		-- python debugger
		"mfussenegger/nvim-dap-python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui"
		},
		ft = {'python'},
		config = function ()
			local path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
		end
	}
}
