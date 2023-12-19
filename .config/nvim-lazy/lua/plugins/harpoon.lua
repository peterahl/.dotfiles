return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      local harpoon = require("harpoon"):setup()
      harpoon:setup()

      vim.keymap.set("n", "<leader>hm", function() harpoon:list():append() end,
        { silent = true, desc = "harpoon add mark" })
      vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
        { silent = true, desc = "harpoon ui" })

      vim.keymap.set("n", "<M-a>", function() harpoon:list():select(1) end, { silent = true, desc = "harpoon 1" })
      vim.keymap.set("n", "<M-o>", function() harpoon:list():select(2) end, { silent = true, desc = "harpoon 2" })
      vim.keymap.set("n", "<M-e>", function() harpoon:list():select(3) end, { silent = true, desc = "harpoon 3" })
      vim.keymap.set("n", "<M-u>", function() harpoon:list():select(4) end, { silent = true, desc = "harpoon 4" })
      vim.keymap.set("n", "<M-i>", function() harpoon:list():select(5) end, { silent = true, desc = "harpoon 5" })
    end,
  },
}
