require('plugins')
require('theme')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.wo.relativenumber = true
vim.opt.clipboard = unnamedplus
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.signcolumn = "auto"
vim.opt.wrap = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

local keymap = vim.api.nvim_set_keymap
local opts = {
	noremap = true,
}

-- CMake
keymap('', '<leader>cg', ':CMakeGenerate<cr>', {})
keymap('', '<leader>cb', ':CMakeBuild<cr>', {})
keymap('', '<leader>cq', ':CMakeClose<cr>', {})
keymap('', '<leader>cc', ':CMakeClean<cr>', {})

-- Telescope
keymap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)

-- floaterm
vim.cmd[[let g:floaterm_keymap_toggle = '<Leader>f']]
vim.cmd[[let g:floaterm_wintype = 'split']]

-- guard
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
-- vim: ft=lua
