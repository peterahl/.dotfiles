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
  --
  {
    "nvim-telescope/telescope.nvim",
    -- change some options
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>ff",
        function() require("telescope.builtin").find_files({ cwd = require('telescope.utils').buffer_dir() }) end,
        desc = "Find Files",
      },
      {
        "<leader>pf",
        function() require("telescope.builtin").git_files() end,
        desc = "Project Files",
      },
      {
        "<leader>*",
        function() require('telescope.builtin').grep_string() end,
        desc = "Search string at point"
      },
      {
        "<leader>sf",
        function() require("telescope.builtin").live_grep({ grep_open_files = true }) end,
        desc = "Search string in files",
      },
      {
        "<leader>sF",
        function() require("telescope.builtin").live_grep({ cwd = require('telescope.utils').buffer_dir() }) end,
        desc = "Search string in current dir",
      }
    },
    opts = {
      defaults = {
        layout_strategy = "vertical",
        path_display = function(opts, path)
          local tail = require("telescope.utils").path_tail(path)
          return string.format("%s%s%s", tail, string.rep(" ", 60 - #tail), path)
        end,
        layout_config = {
          prompt_position = "top",
          preview_cutoff = 40,
        },
        sorting_strategy = "ascending",
        winblend = 0,
      },
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        },
        file_browser = {
          path_display = {},
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            preview_width = 0.6,
          },
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
        project = {
          base_dirs = {
            "~/git",
            "~/.dotfiles",
          },
        },
      }
    },
  },

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
          require('telescope').extensions.file_browser.file_browser({
            path = require('telescope.utils').buffer_dir(),
            display_stat = false,
          })
        end,
        desc = "open file browser",
      },
    },
  },

  {
    "AckslD/nvim-neoclip.lua",
    keys = {
      {
        "<C-p>",
        function()
          require('telescope').extensions.neoclip.neoclip()
        end,
        desc = "open clipboard",
      },
    },
    config = function()
      require("telescope").load_extension("neoclip")
    end,
    opts = {
      default_register = { '"', '+', '*' },
    }
  }
}
