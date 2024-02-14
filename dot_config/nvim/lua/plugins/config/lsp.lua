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
		require("mason-lspconfig").setup()
		require("lspconfig").rust_analyzer.setup {}
		require("lspconfig").bls.setup {}
	end,
}
