local lspconfig = require('lspconfig')

-- Define the custom server configuration for qutels
local qutels_config = {
  default_config = {
    cmd = { "java", "-jar", "/path/to/qute-ls-uberjar.jar" },
    filetypes = { "html" }, -- or any other filetypes qute-ls supports
    root_dir = lspconfig.util.root_pattern(".git", "pom.xml", "build.gradle")
    -- include other settings if needed
  },
}


-- Add the custom server configuration to lspconfig
lspconfig.qutels = qutels_config

-- -- Setup the server
-- lspconfig.qutels.setup {}
