return {
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"buf",
				"eslint_d",
				"google-java-format",
				"yamlfmt",
				"stylua",
				"biome",
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = function()
			local opts = {
				formatters_by_ft = {
					java = { "google-java-format" },
					javascript = { "biome" },
					typescript = { "biome" },
					xml = { "xmlformat" },
					vue = { "eslint_d" },
					proto = { "buf" },
					yaml = { "yamlfmt" },
					lua = { "stylua" },
				},
				formatters = {
					injected = { options = { ignore_errors = true } },
					xmlformat = {
						prepend_args = { "--indent", "2" },
					},
				},
			}
			return opts
		end,
	},
}
