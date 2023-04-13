return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ignore_install = { "help" }
    end,
  },
  {
    "gaelph/logsitter.nvim",
    config = function()
      local logsitter = require("logsitter")
      local javascript_logger = require("logsitter.lang.javascript")
      -- tell logsitter to use the javascript_logger when the filetype is vue
      logsitter.register(javascript_logger, { "vue" })
    end
  },
  { "nvim-treesitter/nvim-treesitter-context" },
}

-- return {
-- 	-- add more treesitter parsers
-- 	{
-- 		"nvim-treesitter/nvim-treesitter",
-- 		opts = {
-- 			ensure_installed = {
-- 				"bash",
-- 				-- "help",
-- 				"html",
-- 				"javascript",
-- 				"json",
-- 				"lua",
-- 				"markdown",
-- 				"markdown_inline",
-- 				"python",
-- 				"query",
-- 				"regex",
-- 				"tsx",
-- 				"typescript",
-- 				"vim",
-- 				"yaml",
-- 			},
-- 		},
-- 	},
--
-- 	-- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
-- 	-- would overwrite `ensure_installed` with the new value.
-- 	-- If you'd rather extend the default config, use the code below instead:
-- 	{
-- 		"nvim-treesitter/nvim-treesitter",
-- 		opts = function(_, opts)
-- 			-- add tsx and treesitter
-- 			vim.list_extend(opts.ensure_installed, {
-- 				"tsx",
-- 				"typescript",
-- 			})
-- 		end,
-- 	},
-- }
