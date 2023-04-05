return {
	{
		"telescope.nvim",
		dependencies = {
			"ThePrimeagen/harpoon",
			config = function()
				require("telescope").load_extension("harpoon")
			end,
		},
	},
}
