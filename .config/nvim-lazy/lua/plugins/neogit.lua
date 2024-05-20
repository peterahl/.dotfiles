return {
	{
		"TimUntersberger/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim", -- optional
		},
		keys = {
			{
				"<leader>gg",
				":Neogit<CR>",
				noremap = true,
				silent = true,
				desc = "neoGit",
			},
			{
				"<leader>gb",
				function()
					require("telescope.builtin").git_branches()
				end,
				noremap = true,
				silent = true,
				desc = "git branches",
			},
		},
		opts = {
			integrations = {
				diffview = true,
			},
			disable_commit_confirmation = true,
			disable_insert_on_commit = false,
			preview_buffer = {
				kind = "vsplit",
			},
			popup = {
				kind = "vsplit",
			},
		},
	},
}
