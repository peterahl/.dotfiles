return {
  {
    'TimUntersberger/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
    },
    keys = {
      { '<leader>gg', ':Neogit<CR>', { noremap = true, silent = true, desc = "neoGit" } },
    },
    opts = {
      integrations = {
        diffview = true,
      },
      disable_commit_confirmation = true,
      disable_insert_on_commit = false,
    }
  }
}
