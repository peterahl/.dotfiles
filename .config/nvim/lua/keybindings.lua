vim.g.mapleader = " "
local wk = require("which-key")
wk.register({
  f = {
    name = "files", 
    f = { "<cmd>Telescope find_files<cr>", "Find File" }, 
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false },
    t = { "<cmd>NvimTreeOpen<cr>", "Open Nvim Tree", noremap=false },
    s = { "<cmd>w<cr>", "Save file", noremap=false },
  },
  b = {
    name = "buffers", 
    b = { "<cmd>Telescope buffers<cr>", "List buffers" },
    d = { "<cmd>bd<cr>", "delete buffer" },
  },
  h = {
    name = "help", 
    t = { "<cmd>Telescope help_tags<cr>", "Help tags" },
  },
  q = {
    name = "quit", 
    q = { "<cmd>qa<cr>", "Quit" },
  },
  s = {
    name = "search", 
    d = { "<cmd>Telescope live_grep<cr>", "Search root dir" },
    s = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search buffer" },
  },
  w = {
    name = "Window", 
    d = { "<cmd>q<cr>", "close window" },
  },
}, { prefix = "<leader>" })

