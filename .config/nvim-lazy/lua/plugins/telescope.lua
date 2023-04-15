return {
  -- change some telescope options and a keymap to browse plugin files
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   keys = {
  --     -- add a keymap to browse plugin files
  --     -- stylua: ignore
  --     {
  --       "<leader>fp",
  --       function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
  --       desc = "Find Plugin File",
  --     },
  --   },
  --   -- change some options
  --   opts = {
  --     defaults = {
  --       layout_strategy = "horizontal",
  --       layout_config = { prompt_position = "top" },
  --       sorting_strategy = "ascending",
  --       winblend = 0,
  --     },
  --   },
  -- },

  -- add telescope-fzf-native
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },

  {
    "nvim-telescope/telescope-project.nvim",
    config = function()
      require("telescope").load_extension("project")
    end,
    keys = {
      {
        "<leader>pp",
        function() require('telescope').extensions.project.project({}) end,
        desc = "open project",
      },
    },
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    config = function()
      require("telescope").load_extension("file_browser")
    end,
    keys = {
      {
        "<M-g><M-r>",
        function()
          require('telescope').extensions.file_browser.file_browser({ path = require('telescope.utils').buffer_dir() })
        end,
        desc = "open file browser",
      },
    },
  },

  {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require("neoclip").setup({
        keys = {
          telescope = {
            i = {
              paste = "<cr>",
            },
          },
        },
      })
      require("telescope").load_extension("neoclip")
    end,
  }
}
