local helpers = require("config.helpers")
local M = {}

function M.get_default_keymaps()
	return {
		{ keys = "<leader>ca", func = vim.lsp.buf.code_action, desc = "Code Actions" },
		{ keys = "<leader>.",  func = vim.lsp.buf.code_action, desc = "Code Actions" },
		{ keys = "<leader>cA", func = M.action.source,         desc = "Source Actions" },
		{ keys = "<leader>cr", func = vim.lsp.buf.rename,      desc = "Code Rename" },
		{ keys = "<leader>cf", func = vim.lsp.buf.format,      desc = "Code Format" },
		{ keys = "<leader>k",  func = vim.lsp.buf.hover,       desc = "Documentation",   has = "hoverProvider" },
		{ keys = "gd",         func = vim.lsp.buf.definition,  desc = "Goto Definition", has = "definitionProvider" },
		{
			keys = "K",
			func = function()
				if (helpers.is_diagnostic() == true) then
					vim.diagnostic.open_float({scope = "cursor"})
				else
					vim.lsp.buf.hover()
				end
			end,
			desc = "Diagnostic"
		}
	}
end

M.on_attach = function(client, buffer)
	local keymaps = M.get_default_keymaps()
	for _, keymap in ipairs(keymaps) do
		if not keymap.has or client.server_capabilities[keymap.has] then
			vim.keymap.set(keymap.mode or "n", keymap.keys, keymap.func, {
				buffer = buffer,
				desc = "LSP: " .. keymap.desc,
				nowait = keymap.nowait,
			})
		end
	end
end

M.action = setmetatable({}, {
	__index = function(_, action)
		return function()
			vim.lsp.buf.code_action({
				apply = true,
				context = {
					only = { action },
					diagnostics = {},
				},
			})
		end
	end,
})

return M
