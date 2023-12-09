return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mfussenegger/nvim-jdtls" },
    opts = {
      inlay_hints = { enabled = true },
      setup = {
        jdtls = function(_, opts)
          vim.api.nvim_create_autocmd("FileType", {
            pattern = "java",
            callback = function()
              require("lazyvim.util").lsp.on_attach(function(client, buffer)
                vim.lsp.inlay_hint.enable(buffer, true)
                -- check if the client in jdtls and set the server_capabilities
                if client.name == "jdtls" then
                  client.server_capabilities.documentFormattingProvider = false
                  vim.keymap.set(
                    "n",
                    "<leader>di",
                    "<Cmd>lua require'jdtls'.organize_imports()<CR>",
                    { buffer = buffer, desc = "Organize Imports" }
                  )
                  vim.keymap.set(
                    "n",
                    "<leader>dt",
                    "<Cmd>lua require'jdtls'.test_class()<CR>",
                    { buffer = buffer, desc = "Test Class" }
                  )
                  vim.keymap.set(
                    "n",
                    "<leader>dn",
                    "<Cmd>lua require'jdtls'.test_nearest_method()<CR>",
                    { buffer = buffer, desc = "Test Nearest Method" }
                  )
                  vim.keymap.set(
                    "v",
                    "<leader>de",
                    "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>",
                    { buffer = buffer, desc = "Extract Variable" }
                  )
                  vim.keymap.set(
                    "n",
                    "<leader>de",
                    "<Cmd>lua require('jdtls').extract_variable()<CR>",
                    { buffer = buffer, desc = "Extract Variable" }
                  )
                  vim.keymap.set(
                    "v",
                    "<leader>dm",
                    "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>",
                    { buffer = buffer, desc = "Extract Method" }
                  )
                end
              end)

              local jdtls = require("jdtls")

              local extendedClientCapabilities = jdtls.extendedClientCapabilities
              extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

              local bundles = {
                vim.fn.glob(
                  "/home/peter/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"
                ),
              }
              vim.list_extend(
                bundles,
                vim.split(
                  vim.fn.glob(
                    "/home/peter/.local/share/nvim/mason/packages/java-test/extension/server/*.jar",
                    1
                  ),
                  "\n"
                )
              )

              local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
              -- vim.lsp.set_log_level('DEBUG')
              local workspace_dir = "/home/peter/.local/share/nvim/java-workspaces/" ..
                  project_name -- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
              local config = {
                cmd = {
                  "/home/peter/.sdkman/candidates/java/current/bin/java",
                  "-javaagent:/home/peter/.local/share/nvim/mason/packages/jdtls/lombok.jar",
                  "-Xbootclasspath/a:/home/peter/.local/share/nvim/mason/packages/jdtls/lombok.jar",
                  "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                  "-Dosgi.bundles.defaultStartLevel=4",
                  "-Declipse.product=org.eclipse.jdt.ls.core.product",
                  "-Dlog.protocol=true",
                  "-Dlog.level=ALL",
                  "-Xms1g",
                  "--add-modules=ALL-SYSTEM",
                  "--add-opens",
                  "java.base/java.util=ALL-UNNAMED",
                  "--add-opens",
                  "java.base/java.lang=ALL-UNNAMED",
                  "-jar",
                  vim.fn.glob(
                    "/home/peter/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
                  ),

                  "-configuration",
                  "/home/peter/.local/share/nvim/mason/packages/jdtls/config_linux",

                  "-data",
                  workspace_dir,
                },
                -- This is the default if not provided, you can remove it. Or adjust as needed.
                -- One dedicated LSP server & client will be started per unique root_dir
                root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
                settings = {
                  java = {
                    signatureHelp = { enabled = true },
                    contentProvider = { preferred = "fernflower" },
                    -- hints = { enabled = true },
                    inlayHints = {
                      parameterNames = { enabled = "all" },
                      propertyValues = { enabled = true },
                      typeHints = { enabled = true },
                      methodChains = { enabled = true },
                      controlFlow = { enabled = true },
                      variableTypes = { enabled = true },
                      casts = { enabled = true },
                    },
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
                        "org.mockito.Mockito.*",
                      },
                    },
                    sources = {
                      organizeImports = {
                        starThreshold = 9999,
                        staticStarThreshold = 9999,
                      },
                    },
                    codeGeneration = {
                      toString = {
                        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                      },
                      hashCodeEquals = {
                        useJava7Objects = true,
                      },
                      useBlocks = true,
                    },
                    configuration = {
                      updateBuildConfiguration = "automatic",
                      -- runtimes = {
                      --   {
                      --     name = "JavaSE-17",
                      --     path = "/home/peter/.sdkman/candidates/java/22.3.0.1.r17-mandrel"
                      --   }
                      -- }
                      resources = {
                        filters = {
                          {
                            type = "location",
                            matches = {
                              "target/generated/**"
                            }
                          }
                        }
                      }
                    },
                  },
                },
                init_options = {
                  -- bundles = bundles,
                  extendedClientCapabilities = extendedClientCapabilities,
                },
                handlers = {
                  ["language/status"] = function(_, result)
                    -- print(result)
                  end,
                  ["$/progress"] = function(_, result, ctx)
                    -- disable progress updates.
                  end,
                },
              }
              jdtls.start_or_attach(config)
            end,
          })
          return true
        end,
      },
    },

  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "java-debug-adapter",
      })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require('dap')

      -- dap.adapters.java = function(callback, config)
      --   local command =
      --   'java'                                                                                                                       -- Path to Java executable
      --   local args = { '-jar',
      --     '/home/peter/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar' } -- Path to Java debug adapter jar
      --   local port = 5005                                                                                                            -- Example port number, can be any free port
      --
      --   callback({ type = 'server', host = config.host, port = port, command = command, args = args })
      -- end

      dap.configurations.java = {
        {
          type = 'java',
          request = 'attach',
          name = "Debug (Attach) - Remote",
          hostName = "127.0.0.1",
          port = 5005,
        },
      }
    end,
  },
}
