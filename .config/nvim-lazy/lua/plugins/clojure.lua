return {

	{ "Olical/aniseed" },

	{ "Olical/conjure" },

	-- { "gpanders/nvim-parinfer" },

	-- {
	--   "guns/vim-sexp",
	--   requires = {
	--     "tpope/vim-repeat",
	--   },
	-- },
	{
		"julienvincent/nvim-paredit",
		config = function()
			local paredit = require("nvim-paredit")
			paredit.setup(
				{
					keys = {
						["<M-j>"] = { paredit.api.drag_form_forwards, "Drag form right" },
						["<M-k>"] = { paredit.api.drag_form_backwards, "Drag form left" },
					}
				}
			)
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
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
