return {
	{
		"phaazon/hop.nvim",
		-- branch = "v1", -- optional but strongly recommended
		opts = {
			keys = "etovxqpdygfblzhckisuran",
		},
		event = "VeryLazy",
		keys = {
			{
				"<M-g><M-g>",
				function()
					require("hop").hint_words()
				end,
				desc = "Hop hint char1",
			},
			{
				"s",
				function()
					require("hop").hint_words()
				end,
				desc = "Hop hint char1",
			},
		},
	},
}
