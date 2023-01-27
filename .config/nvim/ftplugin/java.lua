local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/home/peter/.local/share/nvim/java-workspaces/' .. project_name

local wk = require("which-key")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- -- UI
local finders = require 'telescope.finders'
local sorters = require 'telescope.sorters'
local actions = require 'telescope.actions'
local pickers = require 'telescope.pickers'

local on_attach = function(client, bufnr)
  -- require('jdtls').setup_dap({ hotcodereplace = 'auto' })
  -- require('jdtls').setup_dap_main_class_configs()
  -- require('jdtls.dap').setup_dap_main_class_configs()
  client.server_capabilities.documentFormattingProvider = false
  require('jdtls.setup').add_commands()
  require('jdtls.ui').pick_one_async = function(items, prompt, label_fn, cb)
    local opts = {}
    pickers.new(opts, {
      prompt_title    = prompt,
      finder          = finders.new_table {
        results = items,
        entry_maker = function(entry)
          return {
            value = entry,
            display = label_fn(entry),
            ordinal = label_fn(entry),
          }
        end,
      },
      sorter          = sorters.get_generic_fuzzy_sorter(),
      attach_mappings = function(prompt_bufnr)
        actions.goto_file_selection_edit:replace(function()
          local selection = actions.get_selected_entry(prompt_bufnr)
          actions.close(prompt_bufnr)

          cb(selection.value)
        end)

        return true
      end,
    }):find()
  end


end


local extendedClientCapabilities = require 'jdtls'.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
--
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    -- 💀
    '/home/peter/.sdkman/candidates/java/current/bin/java', -- or '/path/to/java17_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    -- 💀
    '-jar',
    '/home/peter/.local/share/nvim/lsp_servers/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
    -- Must point to the                                                     Change this to
    -- eclipse.jdt.ls installation                                           the actual version


    -- 💀
    '-configuration', '/home/peter/.local/share/nvim/lsp_servers/jdtls/config_linux',
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
    -- Must point to the                      Change to one of `linux`, `win` or `mac`
    -- eclipse.jdt.ls installation            Depending on your system.


    -- 💀
    -- See `data directory configuration` section in the README
    '-data', workspace_dir,
  },

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = 'fernflower' },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.hamcrest.collection.IsMapContaining.*",
          "org.hamcrest.text.IsEqualIgnoringCase.equalToIgnoringCase",
          "org.hamcrest.text.IsEqualIgnoringWhiteSpace.equalToIgnoringWhiteSpace",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "java.util.Objects.requireNonNullElseGet",
          "org.mockito.Mockito.*"
        }
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999
        }
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
        }
      },
      configuration = {
        runtimes = {
          {
            name = "JavaSE-17",
            path = "/home/peter/.sdkman/candidates/java/22.3.0.1.r17-mandrel"
          }
        }
      },
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.

  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {},
    extendedClientCapabilities = extendedClientCapabilities;
  },
  on_attach = on_attach,
  capabilities = capabilities,
}


wk.register({
  d = { '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', 'go to lsp_definitions' },
  r = { '<cmd>lua require("telescope.builtin").lsp_references()<CR>', 'find lsp references' },
  i = { '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>', 'lsp_implementations' }
}, {
  prefix = "g"
})

wk.register({
  c = {
    name = "code actions",
    a = { '<cmd>lua require("jdtls").code_action()<CR>', 'Code Action' },
    f = { '<cmd>lua require("jdtls").extract_function()<CR>', 'Extract Function' },
    i = { '<cmd>lua require("jdtls").organize_imports()<CR>', 'Organize Imports' },
    m = { '<cmd>lua require("jdtls").extract_variable()<CR>', 'Extract Variable' },
    r = { '<cmd>lua require("jdtls").refactor()<CR>', 'Refactor' },
    v = { '<cmd>lua require("jdtls").extract_variable()<CR>', 'Extract Variable' },
    n = { '<cmd>lua require("jdtls").rename()<CR>', 'Rename' },
  },
}, { prefix = '<localleader>' })

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
      f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "format" },
    }
  },
  d = {
    name = "dap",
    b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    c = { "<cmd>lua require('dap').continue()<cr>", "Continue" },
    i = { "<cmd>lua require('dap').step_into()<cr>", "Step Into" },
    o = { "<cmd>lua require('dap').step_over()<cr>", "Step Over" },
  }
}, {
  prefix = "<localleader>"
})

wk.register({
  ['<C-k>'] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", 'Signature help' },
  K = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'lsp hover' },
})


-- mapb(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', map_opts)

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
