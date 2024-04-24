return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local harpoon = require("harpoon"):setup()
			harpoon:setup({
				settings = {
					save_on_toggle = true,
				},
			})

			vim.keymap.set("n", "<leader>hm", function()
				harpoon:list():add()
			end, { silent = true, desc = "harpoon add mark" })
			vim.keymap.set("n", "<leader>hh", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { silent = true, desc = "harpoon ui" })

			vim.keymap.set("n", "<leader>ha", function()
				harpoon:list():select(1)
			end, { silent = true, desc = "harpoon 1" })
			vim.keymap.set("n", "<leader>ho", function()
				harpoon:list():select(2)
			end, { silent = true, desc = "harpoon 2" })
			vim.keymap.set("n", "<leader>he", function()
				harpoon:list():select(3)
			end, { silent = true, desc = "harpoon 3" })
			vim.keymap.set("n", "<leader>hu", function()
				harpoon:list():select(4)
			end, { silent = true, desc = "harpoon 4" })
			vim.keymap.set("n", "<leader>hi", function()
				harpoon:list():select(5)
			end, { silent = true, desc = "harpoon 5" })
			-- vim.keymap.set("n", "<M-t>", function() harpoon:list():select(6) end, { silent = true, desc = "harpoon 6" })
			-- vim.keymap.set("n", "<M-n>", function() harpoon:list():select(7) end, { silent = true, desc = "harpoon 7" })
			-- vim.keymap.set("n", "<M-s>", function() harpoon:list():select(8) end, { silent = true, desc = "harpoon 8" })
		end,
	},
}
