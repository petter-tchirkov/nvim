local Lsp = require("lsp.shared")

local M = {}

function M.setup()
	vim.lsp.start({
		name = "tailwindcss",
		cmd = { "tailwindcss-language-server", "--stdio" },
		root_dir = vim.fn.getcwd(),
		filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
		capabilities = Lsp.capabilities,
		on_attach = Lsp.on_attach,
		settings = {
			tailwindCSS = {
				experimental = {
					classRegex = {
						{ "tw`([^`]*)", 'tw="([^"]*)', 'tw={"([^"]*)"' },
					},
				},
			},
		},
	})
end

return M
