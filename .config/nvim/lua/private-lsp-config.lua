local map_opts = { noremap = true, silent = true }
local mapb = vim.api.nvim_buf_set_keymap
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local wk = require("which-key")

require("nvim-lsp-installer").setup {
  automatic_installation = true
}
local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  wk.register({
    d = { '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', 'go to lsp_definitions' },
    r = { '<cmd>lua require("telescope.builtin").lsp_references()<CR>', 'find lsp references' },
    i = { '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>', 'lsp_implementations' }
  }, {
    buffer = bufnr,
    prefix = "g"
  })

  wk.register({
    l = {
      name = "lsp",
      d = { "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", "Definition" },
      s = { "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>", "Symbols" },
      -- a = { "<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>", "Actions" },
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Actions" },
      r = { "<cmd>lua require('telescope.builtin').lsp_references()<cr>", "References" },
      i = { "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", "Implementations" },
      t = { "<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>", "Type Def" },
      w = {
        name = 'lsp workspace',
        a = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', 'add buffer to workspace' },
        l = { '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'list workspace floders' },
        r = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'remove workspace folder' },
      },
      b = {
        name = 'buffer',
        r = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'rename buffer' },
        f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "format" },
      }
    }
  }, {
    buffer = bufnr,
    prefix = "<leader>"
  })

  -- mapb(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', map_opts)

  wk.register({
    ['<C-k>'] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", 'Signature help' },
    K = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'lsp hover' },
  })

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
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = true
    require "lsp-format".on_attach(client)
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}
lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
lspconfig.volar.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
lspconfig.prismals.setup {
  on_attach = function(client, bufnr)
    require "lsp-format".on_attach(client)
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}
lspconfig.gopls.setup {
  on_attach = function(client, bufnr)
    require "lsp-format".on_attach(client)
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}
lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
lspconfig.jsonls.setup {
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
lspconfig.yamlls.setup {
  on_attach = function(client, bufnr)
    require "lsp-format".on_attach(client)
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}
lspconfig.sqls.setup {
  on_attach = function(client, bufnr)
    require('sqls').on_attach(client, bufnr)
    -- require "lsp-format".on_attach(client)
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}
