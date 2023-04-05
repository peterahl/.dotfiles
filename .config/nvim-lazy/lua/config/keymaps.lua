-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")

local opts = { noremap = true, silent = true }
local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

-- harpoon
wk.register({
	["<M-a>"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", "Harpoon 1" },
	["<M-o>"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", "Harpoon 2" },
	["<M-e>"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", "Harpoon 3" },
	["<M-u>"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", "Harpoon 4" },
	["<M-i>"] = { "<cmd>lua require('harpoon.ui').nav_file(5)<CR>", "Harpoon 5" },
	["<M-h>"] = {
		name = "harpoon",
		["<M-m>"] = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "Add mark" },
		["<M-u>"] = { "<cmd>Telescope harpoon marks<CR>", "Telescope harpoon ui" },
		["<M-h>"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Harpoon ui" },
	},
	["<M-t>"] = {
		name = "harpoon term",
		["<M-a>"] = { "<cmd>lua require('harpoon.term').gotoTerminal(1)<CR>", "Terminal 1" },
		["<M-o>"] = { "<cmd>lua require('harpoon.term').gotoTerminal(2)<CR>", "Terminal 2" },
		["<M-e>"] = { "<cmd>lua require('harpoon.term').gotoTerminal(3)<CR>", "Terminal 3" },
		["<M-u>"] = { "<cmd>lua require('harpoon.term').gotoTerminal(4)<CR>", "Terminal 4" },
		["<M-i>"] = { "<cmd>lua require('harpoon.term').gotoTerminal(5)<CR>", "Terminal 5" },
	},
})

--Telescope
wk.register({
	["<M-x>"] = { "<cmd>Telescope commands<CR>", "commands" },
})

--vim
vim.cmd([[nnoremap j jzz]])
vim.cmd([[nnoremap k kzz]])
vim.cmd([[nnoremap n nzz]])
vim.cmd([[nnoremap N Nzz]])
vim.cmd([[nnoremap { {zz]])
vim.cmd([[nnoremap } }zz]])
vim.cmd([[nnoremap <C-d> <C-d>zz]])
vim.cmd([[nnoremap <C-u>  <C-u>zz]])
vim.cmd([[:tnoremap <Esc> <C-\><C-n>]])

map("n", "<leader>fs", "<cmd>w<cr>", { desc = "save file" })
