return {
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"sqlfluff",
				"autopep8",
				"autoflake",
				"flake8",
				"black",
				"buf",
			})
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "mason.nvim" },
		opts = function(_, opts)
			local null_ls = require("null-ls")
			opts.root_dir =
				require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git", "pom.xml")
			opts.sources = vim.list_extend(opts.sources, {
				null_ls.builtins.diagnostics.sqlfluff.with({
					extra_args = { "--dialect", "mysql" },
				}),
				null_ls.builtins.formatting.sqlfluff.with({
					extra_args = { "--dialect", "mysql" },
				}),
				null_ls.builtins.formatting.google_java_format,
				null_ls.builtins.formatting.buf,
				null_ls.builtins.formatting.rome,
				null_ls.builtins.formatting.autopep8,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.buf,
				null_ls.builtins.diagnostics.buf,
				null_ls.builtins.diagnostics.checkstyle.with({
					extra_args = { "-c", "/home/peter/.local/share/google/google_checks.xml" },
				}),
			})
		end,
	},
}
