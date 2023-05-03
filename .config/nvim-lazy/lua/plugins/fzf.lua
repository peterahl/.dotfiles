return {
  {
    "ibhagwan/fzf-lua",
    requires = { "kyazdani42/nvim-web-devicons" },
    keys = {
      { "<leader>sp", "<cmd>FzfLua grep_project<cr>", desc = "Search project" },
      { "<leader>sP", "<cmd>FzfLua grep_project<cr>", desc = "Search project" },
    },
    opts = {
      winopts = {
        preview = {
          vertical = "up:65%",
          layout = "vertical",
        },
      },
      -- format_entry = function(path)
      --   -- local tail = require("nvim-fzf-commands.utils").path_tail(path)
      --   local tail = require("telescope.utils").path_tail(path)
      --   return string.format("%s%s%s", tail, string.rep(" ", 60 - #tail), path)
      -- end
    }
  }
}
