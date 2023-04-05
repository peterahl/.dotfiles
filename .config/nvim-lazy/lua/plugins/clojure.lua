return {

	{ "Olical/aniseed" },

	{ "Olical/conjure" },

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			-- add tsx and treesitter
			vim.list_extend(opts.ensure_installed, {
				"clojure",
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		---@class PluginLspOpts
		opts = {
			---@type lspconfig.options
			servers = {
				-- ["clj-kondo"] = {},
				clojure_lsp = {},
			},
		},
	},
}
