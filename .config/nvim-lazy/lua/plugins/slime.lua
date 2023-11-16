return {
  -- ... your other plugins ...
  {
    "jpalardy/vim-slime",
    config = function()
      -- Configuration for vim-slime
      vim.g.slime_target = "neovim"
      vim.g.slime_default_config = { socket_name = "default", target_pane = ":.2" }
      vim.g.slime_dont_ask_default = 1
      vim.g.slime_python_ipython = 1
      -- Other vim-slime settings can be configured here
    end
  },
  -- ... rest of your plugins ...
}
