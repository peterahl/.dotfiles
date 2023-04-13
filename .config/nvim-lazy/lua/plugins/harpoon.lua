return {
  {
    "telescope.nvim",
    dependencies = {
      "ThePrimeagen/harpoon",
      config = function()
        require("telescope").load_extension("harpoon")
      end,
    },
    keys = {
      { "<M-a>",      function() require('harpoon.ui').nav_file(1) end,            desc = "harpoon 1", },
      { "<M-o>",      function() require('harpoon.ui').nav_file(2) end,            desc = "harpoon 2", },
      { "<M-e>",      function() require('harpoon.ui').nav_file(3) end,            desc = "harpoon 3", },
      { "<M-u>",      function() require('harpoon.ui').nav_file(4) end,            desc = "harpoon 4", },
      { "<M-i>",      function() require('harpoon.ui').nav_file(5) end,            desc = "harpoon 5", },
      { "<M-h><M-m>", function() require('harpoon.mark').add_file() end,           desc = "add mark", },
      { "<M-h><M-u>", function() require('telescope.builtin').harpoon_marks() end, desc = "telescope harpoon ui", },
      { "<M-h><M-h>", function() require('harpoon.ui').toggle_quick_menu() end,    desc = "harpoon ui", },
      { "<M-t><M-a>", function() require('harpoon.tmux').gotoTerminal(1) end,      desc = "Terminal 1" },
      { "<M-t><M-o>", function() require('harpoon.tmux').gotoTerminal(2) end,      desc = "Terminal 2" },
      { "<M-t><M-e>", function() require('harpoon.tmux').gotoTerminal(3) end,      desc = "Terminal 3" },
      { "<M-t><M-u>", function() require('harpoon.tmux').gotoTerminal(4) end,      desc = "Terminal 4" },
      { "<M-t><M-i>", function() require('harpoon.tmux').gotoTerminal(5) end,      desc = "Terminal 5" },
    },
  },
}
