return {
	{
		"zbirenbaum/copilot.lua",
		event = { "BufReadPre", "BufNewFile" },
		cmd = "Copilot",
		build = ":Copilot auth",
		opts = {
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<TAB>",
				},
			},
			panel = {
				enabled = true,
				auto_refresh = true,
			},
			filetypes = {
				["*"] = true,
			},
		},
	},
}
