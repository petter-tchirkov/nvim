local diagnostics = {
	Error = " ",
	Warn = " ",
	Hint = " ",
	Info = " ",
}

vim.diagnostic.config({
	underline = true,
	update_in_insert = false,
	virtual_text = {
		spacing = 4,
		source = "if_many",
		prefix = "●",
	},
	severity_sort = true,
	signs = {
		[vim.diagnostic.severity.ERROR] = diagnostics.Error,
		[vim.diagnostic.severity.WARN] = diagnostics.Warn,
		[vim.diagnostic.severity.HINT] = diagnostics.Hint,
		[vim.diagnostic.severity.INFO] = diagnostics.Info,
	},
})
