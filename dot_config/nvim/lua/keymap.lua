local keymap = vim.api.nvim_set_keymap
local opts = {
	noremap = true,
}

-- Split
keymap('', '<leader>sv', ':vsplit<cr>', { desc = "Split Vertically" })
keymap('', '<leader>ss', ':split<cr>', { desc = "Split Horizontally" })

-- CMake
keymap('', '<leader>cg', ':CMakeGenerate<cr>', {})
keymap('', '<leader>cb', ':CMakeBuild<cr>', {})
keymap('', '<leader>cq', ':CMakeClose<cr>', {})
keymap('', '<leader>cc', ':CMakeClean<cr>', {})

-- Telescope
-- keymap('', '', { desc = "Telescope" })
keymap('', '<leader>t', "", { desc = "Telescope" })
keymap('', '<leader>tf', "<cmd>lua require('telescope.builtin').find_files()<cr>", { desc = "Fuzzy-Find Files" })
keymap('', '<leader>tg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", { desc = "Live Grep" })
keymap('', '<leader>tb', "<cmd>lua require('telescope.builtin').buffers()<cr>", { desc = "Buffers" })
keymap('', '<leader>th', "<cmd>lua require('telescope.builtin').help_tags()<cr>", { desc = "Help" })

-- Open
keymap('', '<leader>bh', ":e ~/<cr>", { desc = "Browse Home" })
keymap('', '<leader>bn', ":e ~/.config/nvim<cr>", { desc = "Browse NVIM Config" })
keymap('', '<leader>bg', ":e ~/git<cr>", { desc = "Browse Git" })
