return {

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"graphql",
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		---@class PluginLspOpts
		opts = {
			---@type lspconfig.options
			servers = {
				graphql = {
					filetypes = { "graphql", "javascript", "typescript" },
					root_dir = require("null-ls.utils").root_pattern(".git", "package.json", ".gitignore"),
				},
			},
		},
	},

	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"graphql-language-service-cli",
			},
		},
	},
}
