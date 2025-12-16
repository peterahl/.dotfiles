return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "buf",
        "eslint_d"
      })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = "LazyFile",
    opts = function()
      local opts = {
        -- Event to trigger linters
        events = { "BufWritePost", "BufReadPost", "InsertLeave" },
        linters_by_ft = {
          proto = { "buf_lint" },
          vue = { "eslint_d" },
        },
        linters = {
        },
      }
      return opts
    end,
  }

}
