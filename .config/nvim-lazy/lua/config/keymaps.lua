-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

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
-- map("n", "<leader>al", "<cmd>Logsitter<cr>", { desc = "Logsitter" })

map("i", "<Tab>", '<cmd>lua require("copilot.suggestion").accept()<cr>', { desc = "copilot accept" })

--Telescope
map("n", "<M-x>", '<cmd>Telescope commands<cr>', { desc = "commands" })
