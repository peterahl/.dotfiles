local map_opts = { noremap=true, silent=true }
local mapb = vim.api.nvim_buf_set_keymap
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp_installer = require("nvim-lsp-installer")

local on_attach = function(client, bufnr)
  require("lsp-format").on_attach(client)
  print(client.name, 'lsp formatting')
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  mapb(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', map_opts)
  mapb(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', map_opts)
  mapb(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', map_opts)
  mapb(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', map_opts)
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

local on_attach_no_format = function(client, bufnr)
  client.resolved_capabilities.document_formatting = false
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  mapb(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', map_opts)
  mapb(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', map_opts)
  mapb(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', map_opts)
  mapb(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', map_opts)
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

local servers = {'volar', 'tsserver', 'tailwindcss', 'graphql', 'prismals', 'eslint'}

local enhance_server_opts = {
  ["eslint"] = function(opts)
    opts.settings = {
      format = {
        enable = true,
      },
    }
  end,
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    server:install()
  end
end

lsp_installer.on_server_ready(function(server)
  local opts = {
    capabilities = capabilities,
    on_attach = on_attach
  }
  if enhance_server_opts[server.name] then
    enhance_server_opts[server.name](opts)
  end
  server:setup(opts)
end)

local luadev = require("lua-dev").setup({})

require('lspconfig').sumneko_lua.setup(luadev)
