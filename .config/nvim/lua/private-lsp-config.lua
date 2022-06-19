local map_opts = { noremap = true, silent = true }
local mapb = vim.api.nvim_buf_set_keymap
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- local wk = require("which-key")

require("nvim-lsp-installer").setup {
  automatic_installation = true
}
local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  mapb(bufnr, 'n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', map_opts)
  mapb(bufnr, 'n', 'gD', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', map_opts)
  mapb(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', map_opts)
  mapb(bufnr, 'n', 'gi', '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>', map_opts)
  mapb(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', map_opts)
  mapb(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', map_opts)
  mapb(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', map_opts)
  mapb(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', map_opts)
  mapb(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', map_opts)
  mapb(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', map_opts)
  mapb(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', map_opts)
  mapb(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', map_opts)
  mapb(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', map_opts)
end


local luadev = require("lua-dev").setup({
  lspconfig = {
    on_attach = function(client, bufnr)
      require "lsp-format".on_attach(client)
      on_attach(client, bufnr)
    end,
    capabilities = capabilities,
  }
})
lspconfig.sumneko_lua.setup(luadev)

lspconfig.eslint.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
lspconfig.prismals.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
lspconfig.gopls.setup {
  on_attach = function(client, bufnr)
    require "lsp-format".on_attach(client)
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}
lspconfig.graphql.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
lspconfig.sqls.setup {
  on_attach = function(client, bufnr)
    require('sqls').on_attach(client, bufnr)
    require "lsp-format".on_attach(client)
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  settings = {
    sqls = {
      connections = {
        {
          driver = 'mysql',
          dataSourceName = 'root:my-secret-pw@tcp(localhost:3306)/latestprod?multipleStatements=true',
        },
        -- {
        --   driver = 'postgresql',
        --   dataSourceName = 'host=127.0.0.1 port=15432 user=postgres password=mysecretpassword1234 dbname=dvdrental sslmode=disable',
        -- },
      },
    },
  },
}
