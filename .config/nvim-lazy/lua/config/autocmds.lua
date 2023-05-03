-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--local vim = vim


local api = vim.api
local M = {}
-- function to create a list of commands and convert them to autocommands
-------- This function is taken from https://github.com/norcalli/nvim_utils
function M.nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    api.nvim_command('augroup ' .. group_name)
    api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten { 'autocmd', def }, ' ')
      api.nvim_command(command)
    end
    api.nvim_command('augroup END')
  end
end

local autoCommands = {
  -- other autocommands
  open_folds = {
    { "BufEnter,BufReadPost,FileReadPost", "*", "normal zR" },
    { "BufEnter",                          "*", "normal zx" }
  },
  plant_uml = {
    { "BufWritePost", "*.puml", "silent !plantuml % > /dev/null 2>&1 &" }
  }
}

M.nvim_create_augroups(autoCommands)
