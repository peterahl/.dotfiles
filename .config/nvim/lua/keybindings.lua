vim.g.mapleader = " "
local wk = require("which-key")

wk.register({
  f = {
    name = "files",
    f = { "<cmd>lua require('telescope.builtin').find_files({cwd=require('telescope.utils').buffer_dir()})<cr>", "Find File" },
    b = { ":lua require'telescope'.extensions.file_browser.file_browser{cwd=require('telescope.utils').buffer_dir()}<cr>", "File Browser" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false },
    t = { "<cmd>NvimTreeOpen<cr>", "Open Nvim Tree", noremap=false },
    s = { "<cmd>w<cr>", "Save file", noremap=false },
  },
  p = {
    name = "projec",
    f = { "<cmd>Telescope git_files<cr>", "Projec files" },
    p = { ":lua require'telescope'.extensions.project.project{}<cr>", "Projects" },
    b = { ":lua require'telescope'.extensions.file_browser.file_browser{}<cr>", "File Browser" },
  },
  l = {
    name = "lsp",
    d = { "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", "Definition" },
    s = { "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>", "Symbols" },
    a = { "<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>", "Actions" },
    r = { "<cmd>lua require('telescope.builtin').lsp_references()<cr>", "References" },
    i = { "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", "Implementations" },
    t = { "<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>", "Type Def" },
    f = {
      name = "formt",
      b = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "buffer" },
    },
  },
  b = {
    name = "buffers",
    b = { "<cmd>lua require('telescope.builtin').buffers({sort_lastused=true})<cr>", "List buffers" },
    d = { "<cmd>bp|bd #<cr>", "delete buffer" },
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
  },
  q = {
   name = "quit",
    q = { "<cmd>qa<cr>", "Quit" },
    p = { "<cmd>echo 'hello'<cr>", "print hello" },
    r = { "<cmd>source $NVIM_RC<cr>", "Reload" },
  },
  s = {
    name = "search",
    d = { "<cmd>lua require('telescope.builtin').live_grep({cwd=require('telescope.utils').buffer_dir()})<cr>", "Search dir" },
    f = { "<cmd>lua require('telescope.builtin').live_grep({grep_open_file=rue})<cr>", "Search open files" },
    p = { "<cmd>FzfLua grep_project<cr>", "Search project" },
    s = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search buffer" },
  },
  w = {
    name = "Window",
    d = { "<cmd>q<cr>", "close window" },
    m = { "<cmd>only<cr>", "close window" },
  },
}, { prefix = "<leader>" })
