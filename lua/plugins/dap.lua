return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"theHamsta/nvim-dap",
		},
    -- stylua: ignore
    keys = {
      { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
      { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Breakpoint", mode = {"n"}},
      { "<leader>dc", function() require("dap").continue() end, desc = "Continue", mode = {"n"}},
      { "<leader>do", function() require("dap").step_over() end, desc = "Step Over", mode = {"n"}},
      { "<leader>di", function() require("dap").step_in() end, desc = "Step In", mode = {"n"}},
      { "<leader>ds", function() require("dap").continue() end, desc = "Inspect", mode = {"n"}},
    },
		opts = {},
		config = function(_, opts)
			-- setup dap config by VsCode launch.json file
			-- require("dap.ext.vscode").load_launchjs()
			local dap = require("dap")
			local dapui = require("dapui")
			local mason_registry = require("mason-registry")
			local codelldb_root = mason_registry.get_package("codelldb"):get_install_path() .. "/extension/"
			local codelldb_path = codelldb_root .. "adapter/codelldb"
			local liblldb_path = codelldb_root .. "lldb/lib/liblldb.so"
			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				host = "127.0.0.1",
				executable = {
					command = codelldb_path,
					args = { "--liblldb", liblldb_path, "--port", "${port}" },
				},
			}
			dap.configurations.cpp = {
				{
					name = "Debug using codelldb",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopAtEntry = true,
				},
				{
					type = "codelldb",
					request = "attach",
					name = "Attach to process",
					processId = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
			}
			dap.configurations.c = dap.configurations.cpp
			dapui.setup(opts)
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({})
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close({})
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close({})
			end
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			local dap_virtaul_text = require("nvim-dap-virtual-text")
			dap_virtaul_text.setup({})
		end,
	},
}
