-- if LOADED_JDTLS then return end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- local extendedClientCapabilities = jdtls.extendedClientCapabilities
-- extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
-- extendedClientCapabilities.document_formatting = false
--
-- local config = {
--   cmd = {
--     "java",
--     "-Declipse.application=org.eclipse.jdt.ls.core.id1",
--     "-Dosgi.bundles.defaultStartLevel=4",
--     "-Declipse.product=org.eclipse.jdt.ls.core.product",
--     "-Dlog.protocol=true",
--     "-Dlog.level=ALL",
--     "-Xms1g",
--     "--add-modules=ALL-SYSTEM",
--     "--add-opens", "java.base/java.util=ALL-UNNAMED",
--     "--add-opens", "java.base/java.lang=ALL-UNNAMED",
--
--     "-jar", vim.fn.expand("~/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
--     "-configuration", vim.fn.expand "~/.local/share/nvim/mason/packages/jdtls/config_mac",
--
--     "-data", workspace_dir,
--   },
--   capabilities = capabilities,
--   root_dir = root_dir,
--   single_file_support = true,
--   settings = {
--     java = {
--       eclipse = {
--         downloadSources = true,
--       },
--       maven = {
--         downloadSources = true,
--       },
--       signatureHelp = { enabled = true },
--       contentProvider = { preferred = "fernflower" },
--       saveActions = {
--         organizeImports = true
--       },
--       sources = {
--         organizeImports = {
--           starThreshold = 9999,
--           staticStarThreshold = 9999,
--         }
--       },
--       configuration = {
--         updateBuildConfiguration = "interactive",
--         runtimes = {
--           {
--             name = "JavaSE-11",
--             path = "/usr/local/opt/java11/libexec/openjdk.jdk/Contents/Home/"
--           },
--           {
--             name = "JavaSE-17",
--             path = "/usr/local/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home/"
--           },
--           {
--             name = "JavaSE-18",
--             path = "/usr/local/opt/java/libexec/openjdk.jdk/Contents/Home/"
--           },
--         }
--       },
--       implementationsCodeLens = {
--         enabled = true,
--       },
--       referencesCodeLens = {
--         enabled = true,
--       },
--       references = {
--         includeDecompiledSources = true,
--       },
--       inlayHints = {
--         parameterNames = {
--           enabled = "all",
--         },
--       },
--       format = {
--         enabled = true,
--       },
--     },
--     completion = {
--       maxResults = 20,
--       favoriteStaticMembers = {
--         "org.hamcrest.MatcherAssert.assertThat",
--         "org.hamcrest.Matchers.*",
--         "org.hamcrest.CoreMatchers.*",
--         "org.junit.jupiter.api.Assertions.*",
--         "java.util.Objects.requireNonNull",
--         "java.util.Objects.requireNonNullElse",
--         "org.mockito.Mockito.*",
--       },
--     },
--     codeGeneration = {
--       generateComments = true,
--       toString = {
--         template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
--       },
--       useBlocks = true,
--     },
--     flags = {
--       debounce_text_changes = 150,
--       allow_incremental_sync = true,
--     },
--   },
--   on_init = function(client)
--     client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
--   end,
--   init_options = {
--     jvm_args = "-javaagent:" .. vim.fn.expand "~/.local/share/nvim/mason/packages/jdtls/lombok.jar",
--     -- workspace = workspace_dir .. project_name,
--     bundles = bundles,
--     extendedClientCapabilities = extendedClientCapabilities,
--   },
--   handlers = {
--     ["language/status"] = function() end,
--     ["workspace/diagnostic/refresh"] = function() end,
--     ["textDocument/codeAction"] = function() end,
--     ["textDocument/rename"] = function() end,
--     ["workspace/applyEdit"] = function() end,
--     ["textDocument/documentHighlight"] = function() end,
--   },
--   on_attach = function()
--     jdtls.setup_dap { hotcodereplace = "auto" }
--     require("jdtls.dap").setup_dap_main_class_configs()
--     require("jdtls.setup").add_commands()
--   end
-- }
--
-- vim.cmd(
--   "command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)"
-- )
-- vim.cmd(
--   "command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)"
-- )
-- vim.cmd("command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()")
-- -- vim.cmd "command! -buffer JdtJol lua require('jdtls').jol()"
-- vim.cmd("command! -buffer JdtBytecode lua require('jdtls').javap()")
-- -- vim.cmd "command! -buffer JdtJshell lua require('jdtls').jshell()"
--
-- jdtls.start_or_attach(config)
--
-- local mappings = {
--   J = {
--     name = "Java",
--     o = { function() require("jdtls").organize_imports() end, "Organize Imports" },
--     v = { function() require("jdtls").extract_variable() end, "Extract Variable" },
--     c = { function() require("jdtls").extract_constant() end, "Extract Constant" },
--     t = {
--       name = "Test (DAP)",
--       c = { function() require("jdtls").test_class() end, "Class" },
--       m = { function() require("jdtls").test_nearest_method() end, "Nearest Method" },
--     },
--     S = {
--       function()
--         require "jdtls".setup_dap { hotcodereplace = "auto" }
--         require "jdtls.dap".setup_dap_main_class_configs()
--         require "jdtls.setup".add_commands()
--       end,
--       "Setup dap for Java",
--     },
--   },
-- }
--
-- local vmappings = {
--   J = {
--     name = "Java",
--     v = { function() require("jdtls").extract_variable(true) end, "Extract Variable" },
--     c = { function() require("jdtls").extract_constant(true) end, "Extract Constant" },
--     m = { function() require("jdtls").extract_method(true) end, "Extract Method" },
--     t = {
--       name = "Test (DAP)",
--       c = { function() require("jdtls").test_class() end, "Class" },
--       m = { function() require("jdtls").test_nearest_method() end, "Nearest Method" },
--     },
--   },
-- }

local bundles = {
	vim.fn.glob(
		"/home/peter/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"
	),
}
table.insert(bundles, "/home/peter/git/github/quarkus-ls/qute.ls/com.redhat.qute.ls/target/com.redhat.qute.ls-uber.jar")
vim.list_extend(
	bundles,
	vim.split(vim.fn.glob("/home/peter/.local/share/nvim/mason/packages/java-test/extension/server/*.jar", 1), "\n")
)

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
-- vim.lsp.set_log_level('DEBUG')
local workspace_dir = "/home/peter/.local/share/nvim/java-workspaces/" .. project_name -- See `:help vim.lsp.start_client` for an overview of the supported `config` options.

local jdtls_settings = {
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
			runtimes = {
				{
					name = "JavaSE-21",
					path = "/home/peter/.sdkman/candidates/java/current",
				},
			},
			resources = {
				filters = {
					{
						type = "location",
						matches = {
							"target/generated/**",
						},
					},
				},
			},
		},
	},
}

local on_attach = function(client, buffer)
	vim.lsp.inlay_hint.enable(true, { buffer })
	-- check if the client in jdtls and set the server_capabilities
	if client.name == "jdtls" then
		client.server_capabilities.documentFormattingProvider = false
		vim.keymap.set(
			"n",
			"<leader>ci",
			"<Cmd>lua require'jdtls'.organize_imports()<CR>",
			{ buffer = buffer, desc = "Organize Imports" }
		)
		vim.keymap.set(
			"n",
			"<leader>ct",
			"<Cmd>lua require'jdtls'.test_class()<CR>",
			{ buffer = buffer, desc = "Test Class" }
		)
		vim.keymap.set(
			"n",
			"<leader>cn",
			"<Cmd>lua require'jdtls'.test_nearest_method()<CR>",
			{ buffer = buffer, desc = "Test Nearest Method" }
		)
		vim.keymap.set(
			"v",
			"<leader>ce",
			"<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>",
			{ buffer = buffer, desc = "Extract Variable" }
		)
		vim.keymap.set(
			"n",
			"<leader>ce",
			"<Cmd>lua require('jdtls').extract_variable()<CR>",
			{ buffer = buffer, desc = "Extract Variable" }
		)
		vim.keymap.set(
			"v",
			"<leader>cm",
			"<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>",
			{ buffer = buffer, desc = "Extract Method" }
		)
	end
end

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
						-- pattern = "java,html",
						callback = function()
							require("lazyvim.util").lsp.on_attach(on_attach)
							local jdtls = require("jdtls")

							local extendedClientCapabilities = jdtls.extendedClientCapabilities
							extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

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
									-- "/home/peter/.vscode/extensions/redhat.vscode-quarkus-1.17.0/server/com.redhat.qute.ls-uber.jar",
									"-configuration",
									"/home/peter/.local/share/nvim/mason/packages/jdtls/config_linux",

									"-data",
									workspace_dir,
								},
								-- This is the default if not provided, you can remove it. Or adjust as needed.
								-- One dedicated LSP server & client will be started per unique root_dir
								root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
								settings = jdtls_settings,
								init_options = {
									bundles = bundles,
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
			local dap = require("dap")

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
					type = "java",
					request = "attach",
					name = "Debug (Attach) - Remote",
					hostName = "127.0.0.1",
					port = 5005,
				},
			}
		end,
	},
}
