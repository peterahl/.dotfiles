-- This file is automatically loaded by plugins.config
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.autowrite = true -- Enable auto write
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

local o = vim.o
local g = vim.g

vim.filetype.add({
  extension = {
    cql = "sql",
    cljd = "clojure",
  },
})

-- o.background = "dark" -- or "light" for light mode
-- o.expandtab = true
-- o.tabstop = 2
-- o.shiftwidth = 2
o.guifont = "Fira Code SemiBold:h8"

o.scrolloff = 999

g.neovide_cursor_animation_length = 0

g.sexp_enable_insert_mode_mappings = 0

-- -- copilot_filetypes
-- g.copilot_filetypes = { ["*"] = true }

g.maplocalleader = ","

g.gitblame_enabled = 1

-- vim.opt.spell = true
-- vim.opt.spelllang = { 'en_us' }
