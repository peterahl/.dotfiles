return {
	{
		"andrewferrier/debugprint.nvim",
		opts = {
			-- create_keymaps = false,
			-- create_commands = true,
			...,
		},
		event = "VeryLazy", -- or "Lazy" or "LazyVim
		keys = {
			{
				"<leader>al",
				function()
					require("debugprint").debugprint()
				end,
				desc = "DebugPrint",
			},
			{
				"<leader>ad",
				function()
					require("debugprint").deleteprints()
				end,
				desc = "DebugPrint deleteprints",
			},
		},
	},
}
