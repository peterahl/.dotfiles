-- local map_opts = { noremap = true, silent = true }
-- local mapb = vim.api.nvim_buf_set_keymap
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require("mason").setup()
require("mason-lspconfig").setup()

local wk = require("which-key")

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
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Actions" },
      r = { "<cmd>lua require('telescope.builtin').lsp_references()<cr>", "References" },
      i = { "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", "Implementations" },
      t = { "<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>", "Type Def" },
      w = {
        name = 'lsp workspace',
        a = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', 'add buffer to workspace' },
        l = { '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'list workspace floders' },
        r = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'remove workspace folder' },
        s = { '<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>', 'workspace symbols' },
      },
      b = {
        name = 'buffer',
        r = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'rename buffer' },
        f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "format" },
        s = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", "Document symbols" },
      }
    },
    d = {
      name = "dap",
      b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint" },
      c = { "<cmd>lua require('dap').continue()<cr>", "Continue" },
      i = { "<cmd>lua require('dap').step_into()<cr>", "Step Into" },
      o = { "<cmd>lua require('dap').step_over()<cr>", "Step Over" },
      u = {
        name = "ui",
        t = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle Dap UI" },
        o = { "<cmd>lua require('dapui').open()<cr>", "Open Dap UI" },
        c = { "<cmd>lua require('dapui').close()<cr>", "Close Dap UI" },
        h = { "<cmd>lua require('dap.ui.widgets').hover()<cr>", "Open Dap UI Hover" },
        s = { "<cmd>lua require('dapui').float_element('scopes')<cr>", "Open Dap UI Scopes" },
        S = { "<cmd>lua require('dapui').float_element('stacks')<cr>", "Open Dap UI Stacks" },
        b = { "<cmd>lua require('dapui').float_element('breakpoints')<cr>", "Open Dap UI Breakpoints" },
        w = { "<cmd>lua require('dapui').float_element('watches')<cr>", "Open Dap UI Watches" },
        r = { "<cmd>lua require('dapui').float_element('repl')<cr>", "Open Dap UI Repl" },
      }
    }
  }, {
    buffer = bufnr,
    prefix = "<localleader>"
  })

  -- mapb(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', map_opts)

  wk.register({
    ['<C-k>'] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", 'Signature help' },
    K = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'lsp hover' },
  })
end

require("neodev").setup({
})

-- require("nvim-lsp-installer").setup {
--   automatic_installation = true
-- }

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
  on_attach = function(client, bufnr)
    require "lsp-format".on_attach(client)
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  settings = {
    Lua = {
      format = {
        enable = true,
        -- Put format options here
        -- NOTE: the value should be STRING!!
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
        }
      },
      completion = {
        callSnippet = "Replace"
      },
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      }
    }
  }
})

lspconfig.clojure_lsp.setup({
  on_attach = function(client, bufnr)
    require "lsp-format".on_attach(client)
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
})

lspconfig.eslint.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
    require "lsp-format".on_attach(client)
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}
lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
lspconfig.bashls.setup {
  on_attach = function(client, bufnr)
    require "lsp-format".on_attach(client)
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}
lspconfig.volar.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    typescript = {
      tsdk = '/home/peter/.config/nvm/versions/node/v16.13.1/lib/node_modules/typescript/lib'
      -- Alternative location if installed as root:
      -- tsdk = '/usr/local/lib/node_modules/typescript/lib'
    }
  }
}
-- lspconfig.vuels.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
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
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }

}
lspconfig.yamlls.setup {
  on_attach = function(client, bufnr)
    require "lsp-format".on_attach(client)
    on_attach(client, bufnr)
  end,
  capabilities = capabilities
  -- settings = {
  --   yaml = {
  --     format = {
  --       enable = true,
  --       singleQuote = true,
  --       proseWrap = "always",
  --     },
  --   }
  -- }
}
lspconfig.sqls.setup {
  on_attach = function(client, bufnr)
    -- require "lsp-format".on_attach(client)
    on_attach(client, bufnr)
    require('sqls').on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.google_java_format,
  },
  on_attach = function(client, bufnr)
    require "lsp-format".on_attach(client)
  end,
})
