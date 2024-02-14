return {
	'williamboman/mason.nvim',
	name = 'mason',
	event = "VeryLazy",
	dependencies = {
		{ 'neovim/nvim-lspconfig' },
		{ 'williamboman/mason-lspconfig.nvim' },
	},
	init = function()
		require("mason").setup()
		require("mason-lspconfig").setup {
			ensure_installed = {
				"bashls",
				"clangd",
				"lua_ls",
				"rust_analyzer",
			},
		}
		require('lspconfig').setup('lua_ls', {
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = 'LuaJIT',
						-- Setup your lua path
						path = lua_rtp,
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { 'vim' },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file('', true),
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		})
		require("lspconfig").bashls.setup {}
		require("lspconfig").clangd.setup {}
	end,
}
