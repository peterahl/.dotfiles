return {
	{
		"mxsdev/nvim-dap-vscode-js",
		config = function()
			local utils = require("dap-vscode-js.utils")
			require("dap-vscode-js").setup({
				adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
				-- debugger_path = utils.join_paths(utils.get_runtime_dir(), "lazy/vscode-js-debug"),
				debugger_path = require("mason-registry").get_package("js-debug-adapter"):get_install_path(),
				-- .. "/js-debug/src/dapDebugServer.js",
			})
		end,
		dependencies = {
			{
				"mfussenegger/nvim-dap",
				optional = true,
				opts = function()
					local dap = require("dap")
					-- if not dap.adapters["pwa-node"] then
					-- 	require("dap").adapters["pwa-node"] = {
					-- 		type = "server",
					-- 		host = "localhost",
					-- 		port = "${port}",
					-- 		executable = {
					-- 			command = "node",
					-- 			-- 💀 Make sure to update this path to point to your installation
					-- 			args = {
					-- 				require("mason-registry").get_package("js-debug-adapter"):get_install_path()
					-- 					.. "/js-debug/src/dapDebugServer.js",
					-- 				"${port}",
					-- 			},
					-- 		},
					-- 	}
					-- end
					for _, language in ipairs({ "typescript", "javascript" }) do
						if not dap.configurations[language] then
							dap.configurations[language] = {
								{
									type = "pwa-node",
									request = "launch",
									name = "Launch file",
									program = "${file}",
									cwd = "${workspaceFolder}",
									-- skipFiles = {
									-- 	"<node_internals>/**",
									-- },
									-- program = "${workspaceFolder}/src/index.ts",
									-- outFiles = "${workspaceFolder}/**/*.js",
								},
								{
									type = "pwa-node",
									request = "attach",
									name = "Attach",
									processId = require("dap.utils").pick_process,
									cwd = "${workspaceFolder}",
								},
							}
						end
					end
				end,
			},
			-- {
			--   "williamboman/mason.nvim",
			--   opts = function(_, opts)
			--     opts.ensure_installed = opts.ensure_installed or {}
			--     table.insert(opts.ensure_installed, "js-debug-adapter")
			--   end,
			-- },
			--
		},
	},
}
