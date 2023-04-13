return {
  {
    "ibhagwan/fzf-lua",
    requires = { "kyazdani42/nvim-web-devicons" },
    keys = {
      { "<leader>sp", "<cmd>FzfLua grep_project<cr>", desc = "Search project" },
      { "<leader>sP", "<cmd>FzfLua grep_project<cr>", desc = "Search project" },
    },
    -- opts = {
    --   winopts = {
    --     preview = {
    --       vertical = "up:65%",
    --       layout = "vertical",
    --     },
    --   },
    -- }
  }
}
