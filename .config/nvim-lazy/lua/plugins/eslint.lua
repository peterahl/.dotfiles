local Util = require("lazyvim.util")

return {
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"eslint-lsp",
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		---@class PluginLspOpts
		opts = {
			servers = {
				eslint = {
					filetypes = { "vue" },
					root_dir = require("null-ls.utils").root_pattern(".git", "package.json", ".gitignore"),
				},
			},
			setup = {
				eslint = function()
					Util.on_attach(function(client)
						if client.name == "eslint" then
							client.server_capabilities.documentFormattingProvider = true
						end
					end)
				end,
			},
		},
	},
}
