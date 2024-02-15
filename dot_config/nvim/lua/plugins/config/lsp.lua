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
	
		require("lspconfig").bashls.setup {}
		require("lspconfig").clangd.setup {}
		require("lspconfig").lua_ls.setup {}
		require("lspconfig").rust_analyzer.setup {}
	end,
}
