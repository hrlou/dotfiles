-- Various Plugin Setup
require('crates').setup()
require("deferred-clipboard").setup()
require("ibl").setup()
require("nvim-tree").setup()

-- LSP
require('lspconfig')

-- Floaterm
vim.cmd[[let g:floaterm_keymap_toggle = '<Leader>f']]
vim.cmd[[let g:floaterm_wintype = 'split']]

-- Guard
local ft = require("guard.filetype")
ft("c,cpp,json"):fmt("clang-format")
	:lint('clang-tidy')

ft('lua'):fmt('lsp')
	:append('stylua')

ft('rust'):fmt('rustfmt')

require("guard").setup({
	fmt_on_save = true,
	lsp_as_default_formatter = false,
})
