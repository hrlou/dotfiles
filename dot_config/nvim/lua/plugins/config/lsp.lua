require("mason").setup()

-- Setup language servers.
local lspconfig = require('lspconfig')

lspconfig.bashls.setup{}
