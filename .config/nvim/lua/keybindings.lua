-- vim.g.mapleader = " "
local wk = require("which-key")

local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap


-- map('n', '<M-o>', '<C-w>w', opts)
-- map('v', '<S-r>', '"hy/<C-r>h<CR>:%s/<C-r>h//g<left><left>', opts)
-- map('n', '<S-r>', 'lua vim.lsp.buf.rename()', opts)
-- map('n', '<S-r>', ':noh<CR>', opts)
-- map('n', '<M-g><M-g>', '<cmd>HopWord<CR>', opts)

map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

wk.register({
  ['<M-w>'] = { "<C-w>w", "other window" },
  ['<M-x>'] = { "<cmd>Telescope commands<CR>", "commands" },
  ['<M-a>'] = { "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", "Harpoon 1" },
  ['<M-o>'] = { "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", "Harpoon 2" },
  ['<M-e>'] = { "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", "Harpoon 3" },
  ['<M-u>'] = { "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", "Harpoon 4" },
  ['<M-i>'] = { "<cmd>lua require('harpoon.ui').nav_file(5)<CR>", "Harpoon 5" },
  ['<M-h>'] = {
    name = 'harpoon',
    ['<M-m>'] = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "Add mark" },
    ['<M-u>'] = { "<cmd>Telescope harpoon marks<CR>", "Telescope harpoon ui" },
    ['<M-h>'] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Harpoon ui" },
  },
  ['<M-t>'] = {
    name = 'harpoon term',
    ['<M-a>'] = { "<cmd>lua require('harpoon.term').gotoTerminal(1)<CR>", "Terminal 1" },
    ['<M-o>'] = { "<cmd>lua require('harpoon.term').gotoTerminal(2)<CR>", "Terminal 2" },
    ['<M-e>'] = { "<cmd>lua require('harpoon.term').gotoTerminal(3)<CR>", "Terminal 3" },
    ['<M-u>'] = { "<cmd>lua require('harpoon.term').gotoTerminal(4)<CR>", "Terminal 4" },
  },
  ['<M-g>'] = {
    name = 'my g',
    ['<M-g>'] = { "<cmd>HopWord<CR>", 'ace jump' },
    ['<M-r>'] = { ":lua require'telescope'.extensions.file_browser.file_browser{path=require('telescope.utils').buffer_dir()}<cr>",
      "File Browser" },
  }
})

wk.register({
  f = {
    name = "files",
    f = { "<cmd>lua require('telescope.builtin').find_files({cwd=require('telescope.utils').buffer_dir()})<cr>",
      "Find File" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap = false },
    t = { "<cmd>NvimTreeOpen<cr>", "Open Nvim Tree", noremap = false },
    s = { "<cmd>w<cr>", "Save file", noremap = false },
  },
  ['*'] = { "<cmd>lua require('telescope.builtin').grep_string()<cr>", "Search string at point" },
  p = {
    name = "project",
    f = { "<cmd>Telescope git_files<cr>", "Projec files" },
    p = { ":lua require'telescope'.extensions.project.project{}<cr>", "Projects" },
    b = { ":lua require'telescope'.extensions.file_browser.file_browser{}<cr>", "File Browser" },
    t = { ":FloatermNew --cwd=<buffer><cr>", "project terminal" },
  },
  b = {
    name = "buffers",
    b = { "<cmd>lua require('telescope.builtin').buffers({sort_lastused=true})<cr>", "List buffers" },
    d = { "<cmd>bp|bd #<cr>", "delete buffer" },
  },
  o = {
    name = "open",
    t = { ":FloatermNew<CR>", "Terminal" },
  },
  h = {
    name = "help",
    t = { "<cmd>Telescope help_tags<cr>", "Help tags" },
    w = { "<cmd>WhichKey<cr>", "WhichKey" },
  },
  g = {
    name = "git",
    g = { "<cmd>lua require('neogit').open()<cr>", "Neogit" },
    t = { "<cmd>Telescope git_status<cr>", "telescope Git status" },
    b = { "<cmd>Telescope git_branches<cr>", "git branches" },
    s = { "<cmd>Telescope git_status<cr>", "git status" },
  },
  q = {
    name = "quit",
    q = { "<cmd>qa<cr>", "Quit" },
    p = { "<cmd>echo 'hello'<cr>", "print hello" },
    r = { "<cmd>source $NVIM_RC<cr>", "Reload" },
  },
  s = {
    name = "search",
    d = { "<cmd>lua require('telescope.builtin').live_grep({cwd=require('telescope.utils').buffer_dir()})<cr>",
      "Search dir" },
    f = { "<cmd>lua require('telescope.builtin').live_grep({grep_open_file=rue})<cr>", "Search open files" },
    p = { "<cmd>FzfLua grep_project<cr>", "Search project" },
    s = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search buffer" },
  },
  w = {
    name = "Window",
    d = { "<cmd>q<cr>", "close window" },
    m = { "<cmd>only<cr>", "close window" },
    w = { "<C-w>w", "other window" },
    v = { "<C-w>v", "Split vertically" },
    s = { "<C-w>s", "Split horizontally" },
  },
}, { prefix = "<leader>" })
