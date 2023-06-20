require("plugins")

vim.filetype.add({
	extension = {
		cql = "sql",
		cljd = "clojure",
	},
})

local g = vim.g
g.indent_blankline_char = "┊"
-- g.tokyonight_style = 'night'
g.mapleader = " "
g.maplocalleader = ","
g.gitblame_enabled = 1
-- g.neovide_fullscreen = 1
-- g.neovide_transparency = 0.95

local opt = vim.opt
opt.termguicolors = true
opt.completeopt = { "menu", "menuone", "noselect" }
opt.ignorecase = true
opt.smartcase = true
opt.cursorline = true
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

local o = vim.o
o.background = "dark" -- or "light" for light mode
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.guifont = "Fira Code SemiBold:h8"
o.clipboard = "unnamedplus"
o.timeoutlen = 300

o.scrolloff = 999

vim.wo.number = true
vim.wo.relativenumber = true

vim.cmd([[colorscheme gruvbox]])
-- vim.cmd([[colorscheme tokyonight-night]])
-- vim.cmd([[nnoremap j jzz]])
-- vim.cmd([[nnoremap k kzz]])
-- vim.cmd([[nnoremap n nzz]])
-- vim.cmd([[nnoremap N Nzz]])
-- vim.cmd([[nnoremap { {zz]])
-- vim.cmd([[nnoremap } }zz]])
-- vim.cmd([[nnoremap <C-d> <C-d>zz]])
-- vim.cmd([[nnoremap <C-u>  <C-u>zz]])

vim.cmd([[:tnoremap <Esc> <C-\><C-n>]])

vim.g.copilot_node_command = "~/.config/nvm/versions/node/v16.13.1/bin/node"
vim.g.copilot_filetypes = { ["*"] = true }

require("cmp-config")
require("private-lsp-config")
require("keybindings")
require("evil_lualine")
require("auto-commands")

local logsitter = require("logsitter")
local javascript_logger = require("logsitter.lang.javascript")

-- tell logsitter to use the javascript_logger when the filetype is svelte
logsitter.register(javascript_logger, { "vue" })

-- tell logsitter to use the javascript_logger when the filetype is javascript
