return {
	{

		{
			"nvim-treesitter/nvim-treesitter",
			opts = function(_, opts)
				vim.list_extend(opts.ensure_installed, {
					"sql",
				})
			end,
		},
		{
			"williamboman/mason.nvim",
			opts = function(_, opts)
				vim.list_extend(opts.ensure_installed, {
					"sqlls",
				})
			end,
		},

		{
			"neovim/nvim-lspconfig",
			---@class PluginLspOpts
			opts = {
				---@type lspconfig.options
				servers = {
					sqlls = {
						root_dir = require("null-ls.utils").root_pattern(".git", "package.json", ".gitignore"),
					},
				},
			},
		},
	},
}
