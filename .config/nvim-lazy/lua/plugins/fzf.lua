return {
  {
    "ibhagwan/fzf-lua",
    requires = { "kyazdani42/nvim-web-devicons" },
    keys = {
      { "<leader>sg", "<cmd>FzfLua grep_project<cr>", desc = "Search project" },
      { "<leader>sG", "<cmd>FzfLua grep_project<cr>", desc = "Search project" },
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
