return {
	{
		"telescope.nvim",
		dependencies = {
			"ThePrimeagen/harpoon",
			config = function()
				require("telescope").load_extension("harpoon")
			end,
		},
		opts = {
			menu = {
				width = 120,
			},
		},
		keys = {
			{
				"<leader>ha",
				function()
					require("harpoon.ui").nav_file(1)
				end,
				desc = "harpoon 1",
			},
			{
				"<leader>ho",
				function()
					require("harpoon.ui").nav_file(2)
				end,
				desc = "harpoon 2",
			},
			{
				"<leader>he",
				function()
					require("harpoon.ui").nav_file(3)
				end,
				desc = "harpoon 3",
			},
			{
				"<leader>hu",
				function()
					require("harpoon.ui").nav_file(4)
				end,
				desc = "harpoon 4",
			},
			{
				"<leader>hi",
				function()
					require("harpoon.ui").nav_file(5)
				end,
				desc = "harpoon 5",
			},
			{
				"<leader>hm",
				function()
					require("harpoon.mark").add_file()
				end,
				desc = "harpoon add mark",
			},
			{
				"<leader>ht",
				function()
					require("telescope.builtin").harpoon_marks()
				end,
				desc = "telescope harpoon ui",
			},
			{
				"<leader>hh",
				function()
					require("harpoon.ui").toggle_quick_menu()
				end,
				desc = "harpoon ui",
			},
			-- { "<M-t><M-a>", function() require('harpoon.term').gotoTerminal(1) end,      desc = "Terminal 1" },
			-- { "<M-t><M-o>", function() require('harpoon.term').gotoTerminal(2) end,      desc = "Terminal 2" },
			-- { "<M-t><M-e>", function() require('harpoon.term').gotoTerminal(3) end,      desc = "Terminal 3" },
			-- { "<M-t><M-u>", function() require('harpoon.term').gotoTerminal(4) end,      desc = "Terminal 4" },
			-- { "<M-t><M-i>", function() require('harpoon.term').gotoTerminal(5) end,      desc = "Terminal 5" },
		},
	},
}
