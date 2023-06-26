return {
	{
		"AckslD/nvim-neoclip.lua",
		event = "VeryLazy",
		keys = {
			{
				"<leader>tp",
				function()
					require("telescope").extensions.neoclip.neoclip()
				end,
				desc = "open clipboard",
			},
		},
		opts = {
			keys = {
				telescope = {
					i = {
						select = "<tab>",
						paste = "<cr>",
					},
				},
			},
		},
	},
}
