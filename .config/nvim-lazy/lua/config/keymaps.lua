-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }
local Util = require("lazyvim.util")

-- local map = vim.keymap.set
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

--vim
-- vim.cmd([[nnoremap j jzz]])
-- vim.cmd([[nnoremap k kzz]])
-- vim.cmd([[nnoremap n nzz]])
-- vim.cmd([[nnoremap N Nzz]])
-- vim.cmd([[nnoremap { {zz]])
-- vim.cmd([[nnoremap } }zz]])
-- vim.cmd([[nnoremap <C-d> <C-d>zz]])
-- vim.cmd([[nnoremap <C-u>  <C-u>zz]])

vim.cmd([[:tnoremap <Esc> <C-\><C-n>]])

map("n", "<Esc>", "<Esc>", { desc = "Esc" })

map("n", "<leader>fs", "<cmd>w<cr>", { desc = "save file" })

--float term
map("n", "<leader>ft", function() Util.float_term(nil, { cwd = require('telescope.utils').buffer_dir() }) end,
  { desc = "Terminal" })
map("n", "<leader>pt", function() Util.float_term() end, { desc = "Project terminal" })

--Telescope
map("n", "<M-x>", '<cmd>Telescope commands<cr>', { desc = "commands" })

--Tmux
map("n", "<c-h>", ":TmuxNavigateLeft<cr>", { desc = "TmuxNavigateLeft", remap = true, silent = true })
map("n", "<c-j>", ":TmuxNavigateDown<cr>", { desc = "TmuxNavigateDown", remap = true, silent = true })
map("n", "<c-k>", ":TmuxNavigateUp<cr>", { desc = "TmuxNavigateUp", remap = true, silent = true })
map("n", "<c-l>", ":TmuxNavigateRight<cr>", { desc = "TmuxNavigateRight", remap = true, silent = true })
map("n", "<c-\\>", ":TmuxNavigatePrevious<cr>", { desc = "TmuxNavigatePrevious", remap = true, silent = true })
