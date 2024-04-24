local Util = require("lazyvim.util")

local exts = {
	"javascript",
	"typescript",
	"javascriptreact",
	"typescriptreact",
	-- using pwa-chrome
	"vue",
	"svelte",
}

return {
	-- add typescript to treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "typescript", "tsx", "vue" })
			end
		end,
	},

	-- make sure mason installs the server
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"typescript-language-server",
			})
		end,
	},

	{
		"mxsdev/nvim-dap-vscode-js",
		config = function()
			local utils = require("dap-vscode-js.utils")
			require("dap-vscode-js").setup({
				adapters = { "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
				-- debugger_path = utils.join_paths(utils.get_runtime_dir(), "lazy/vscode-js-debug"),
				debugger_path = require("mason-registry").get_package("js-debug-adapter"):get_install_path(),
				-- .. "/js-debug/src/dapDebugServer.js",
			})
		end,
	},

	{
		"mfussenegger/nvim-dap",
		optional = true,
		opts = function()
			local dap = require("dap")

			dap.adapters["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = 9229, --let both ports be the same for now...
				executable = {
					command = "node",
					-- -- 💀 Make sure to update this path to point to your installation
					args = {
						require("mason-registry").get_package("js-debug-adapter"):get_install_path()
							.. "/dapDebugServer.js",
						"9229",
					},
					-- command = "js-debug-adapter",
					-- args = { "${port}" },
				},
			}
			for _, language in ipairs(exts) do
				if not dap.configurations[language] then
					dap.configurations[language] = {
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
							reAttach = true,
							name = "Attach Program (pwa-node)",
							processId = require("dap.utils").pick_process,
							port = 9229,
						},
					}
				end
			end
		end,
	},
},
-- -- correctly setup lspconfig
{
	"neovim/nvim-lspconfig",
	opts = {
		-- make sure mason installs the server
		servers = {
			---@type lspconfig.options.tsserver
			tsserver = {
				settings = {
					completions = {
						completeFunctionCalls = true,
					},
				},
				init_options = {
					preferences = {
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHintsWhenArgumentMatchesName = true,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = false,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = false,
						includeInlayEnumMemberValueHints = true,
						importModuleSpecifierPreference = "non-relative",
					},
				},
			},
		},
		setup = {
			tsserver = function(_, opts)
				opts.capabilities.documentFormattingProvider = false
			end,
		},
	},
}
