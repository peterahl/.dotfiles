vim.g.mapleader = " "
local wk = require("which-key")
wk.register({
  f = {
    name = "files", 
    f = { "<cmd>Telescope find_files<cr>", "Find File" }, 
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false },
  },
  b = {
    name = "buffers", 
    b = { "<cmd>Telescope buffers<cr>", "List buffers" },
  },
  h = {
    name = "help", 
    t = { "<cmd>Telescope help_tags<cr>", "Help tags" },
  },
  s = {
    name = "search", 
    d = { "<cmd>Telescope live_grep<cr>", "Search root dir" },
    b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search buffer" },
  },
}, { prefix = "<leader>" })
