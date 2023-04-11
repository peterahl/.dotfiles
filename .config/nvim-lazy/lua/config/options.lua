-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local o = vim.o
local g = vim.g

-- o.background = "dark" -- or "light" for light mode
-- o.expandtab = true
-- o.tabstop = 2
-- o.shiftwidth = 2
o.guifont = "Fira Code SemiBold:h8"

g.neovide_cursor_animation_length = 0

-- -- copilot_filetypes
-- g.copilot_filetypes = { ["*"] = true }

g.maplocalleader = ","

g.gitblame_enabled = 1
