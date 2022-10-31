require('plugins')

local g = vim.g
g.indent_blankline_char = '┊'
-- g.tokyonight_style = 'night'
g.mapleader = ' '
g.maplocalleader = ','
g.gitblame_enabled = 1
-- g.neovide_fullscreen = 1
-- g.neovide_transparency = 0.95

local opt = vim.opt
opt.termguicolors = true
opt.completeopt = { 'menu', 'menuone', 'noselect' }
opt.ignorecase = true
opt.cursorline = true
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'

local o = vim.o
o.background = "dark" -- or "light" for light mode
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.guifont = "Fira Code:h8"
-- o.clipboard = "unnamedplus"
o.timeoutlen = 300

vim.cmd([[colorscheme tokyonight-night]])
vim.cmd([[nnoremap j jzz]])
vim.cmd([[nnoremap k kzz]])
vim.cmd([[nnoremap n nzz]])
vim.cmd([[nnoremap N Nzz]])
vim.cmd([[nnoremap { {zz]])
vim.cmd([[nnoremap } }zz]])
vim.cmd([[nnoremap <C-d> <C-d>zz]])
vim.cmd([[nnoremap <C-u>  <C-u>zz]])
vim.cmd([[:tnoremap <Esc> <C-\><C-n>]])

vim.g.copilot_node_command = "~/.config/nvm/versions/node/v16.13.1/bin/node"

require('cmp-config')
require('private-lsp-config')
require('keybindings')
require('evil_lualine')
require('auto-commands')
