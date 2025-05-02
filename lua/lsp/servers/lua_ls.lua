local Lsp = require("lsp.shared")

local M = {}

function M.setup()
	vim.lsp.config("lua_ls", {
		cmd = { "lua-language-server" },
		root_dir = vim.fn.getcwd(),
		filetypes = { "lua" }, -- Only attach to Lua files
		capabilities = Lsp.capabilities,
		on_attach = Lsp.on_attach,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim", "bufnr" }, -- Recognize 'vim' as a global variable
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true), -- Include Neovim runtime files
				},
				telemetry = {
					enable = false, -- Disable telemetry
				},
			},
		},
	})

	-- Enable the server
	vim.lsp.enable("lua_ls")
end

return M
