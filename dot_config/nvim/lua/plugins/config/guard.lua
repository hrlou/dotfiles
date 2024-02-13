local ft = require("guard.filetype")
ft("c,cpp,json")
	:fmt("clang-format")
	:lint('clang-tidy')

require("guard").setup({
	fmt_on_save = true,
	lsp_as_default_formatter = false,
})
