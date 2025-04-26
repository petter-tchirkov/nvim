local Lsp = require("lsp.shared")

local M = {}

function M.setup()
	vim.lsp.config("biome", {
		cmd = { "biome", "lsp-proxy" }, -- Replace with the actual command for Biome
		root_dir = vim.fn.getcwd(),
		filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }, -- Adjust filetypes as needed
		capabilities = Lsp.capabilities,
		on_attach = Lsp.on_attach,
		settings = {
			-- Add any Biome-specific settings here
		},
	})

	-- Enable the server
	vim.lsp.enable("biome")
end

return M
