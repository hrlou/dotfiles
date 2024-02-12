require("mason").setup()

-- Setup language servers.
local lspconfig = require('lspconfig')
local coq = require('coq')

lspconfig.bashls.setup{}
