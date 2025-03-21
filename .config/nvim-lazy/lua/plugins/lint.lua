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
          -- Use the "*" filetype to run linters on all filetypes.
          -- ['*'] = { 'global linter' },
          -- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
          -- ['_'] = { 'fallback linter' },
        },
        -- LazyVim extension to easily override linter options
        -- or add custom linters.
        ---@type table<string,table>
        linters = {
          -- -- Example of using selene only when a selene.toml file is present
          -- selene = {
          --   -- `condition` is another LazyVim extension that allows you to
          --   -- dynamically enable/disable linters based on the context.
          --   condition = function(ctx)
          --     return vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true })[1]
          --   end,
          -- },
        },
      }
      return opts
    end,
  }

}
