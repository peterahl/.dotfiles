-- local lspconfig = require('lspconfig')
--
-- -- Define the custom server configuration for qutels
-- local qutels_config = {
--   default_config = {
--     cmd = { "java", "-jar", "/path/to/qute-ls-uberjar.jar" },
--     filetypes = { "java" }, -- or any other filetypes qute-ls supports
--     root_dir = function(fname)
--       return lspconfig.util.find_git_ancestor(fname) or lspconfig.util.path.dirname(fname)
--     end,
--     -- include other settings if needed
--   },
-- }
-- lspconfig.qutels = qutels_config
-- return {
--   {
--     "neovim/nvim-lspconfig",
--     opts = function()
--       local lspconfig = require('lspconfig')
--
--       -- Configure qute-ls here
--       lspconfig.qutels.setup {
--         cmd = { "java", "-jar", "/home/peter/git/github/quarkus-ls/qute.ls/com.redhat.qute.ls/target/com.redhat.qute.ls-uber.jar" }, -- Replace with the correct path to your qute-ls uberjar
--         filetypes = { "html" },                                                                                                      -- Adjust according to the file types you're working with
--         root_dir = lspconfig.util.root_pattern(".git", "pom.xml", "build.gradle"),                                                   -- Adjust the root_dir as per your project structure
--         -- on_attach = function(client, bufnr)
--         -- end,
--       }
--     end,
--   },
-- }

return {}
-- local lsp = require('lspconfig')
--
-- vim.tbl_deep_extend('keep', lsp, {
--   qute = {
--     cmd = { 'command' },
--     filetypes = 'filetype',
--     name = 'qute',
--   }
-- })
--
-- return {
--   {
--     "neovim/nvim-lspconfig",
--     opts = {
--       servers = {
--         -- Add your Qute LSP configuration here
--         qute = {
--           -- cmd = { "path_to_your_qute_lsp_server" },                                                                                  -- Replace with the path to your Qute LSP server
--           cmd = { "java", "-jar", "/home/peter/git/github/quarkus-ls/qute.ls/com.redhat.qute.ls/target/com.redhat.qute.ls-uber.jar" }, -- Replace with the correct path to your qute-ls uberjar
--           filetypes = { "html" },                                                                                                      -- Adjust according to the file types you're working with
--           settings = {
--             -- Any additional settings for Qute LSP
--           },
--           on_attach = function(client, bufnr)
--             -- Any additional configurations when the LSP server attaches to a buffer
--           end,
--         },
--       },
--     },
--   },
--
--   -- ... any other plugin configurations ...
-- }
