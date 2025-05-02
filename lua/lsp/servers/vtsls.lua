-- LSP for TypeScript and JavaScript
local Lsp = require("lsp.shared")
local vue_language_server_path = "/usr/lib/node_modules/@vue/typescript-plugin/"

local M = {}

function M.setup()
	vim.lsp.config("vtsls", {
		cmd = { "vtsls", "--stdio" },
		root_dir = vim.fn.getcwd(),
		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
			"vue"
		},
		capabilities = Lsp.capabilities,
		on_attach = Lsp.on_attach,
		settings = {
			complete_function_calls = true,
			vtsls = {
				enableMoveToFileCodeAction = true,
				autoUseWorkspaceTsdk = true,
				experimental = {
					completion = {
						enableServerSideFuzzyMatch = true,
					},
				},
				tsserver = {
					globalPlugins = {
					  {
					    name = '@vue/typescript-plugin',
					    location = vue_language_server_path,
					    languages = { 'vue' },
					    configNamespace = "typescript",
					    enableForWorkspaceTypeScriptVersions = true,
					  },
					},
				      },
			},
			typescript = {
				updateImportsOnFileMove = { enabled = "always" },
				suggest = {
					completeFunctionCalls = true,
				},
				inlayHints = {
					parameterNames = { enabled = "literals" },
					parameterTypes = { enabled = false },
					variableTypes = { enabled = false },
					propertyDeclarationTypes = { enabled = false },
					functionLikeReturnTypes = { enabled = true },
					enumMemberValues = { enabled = true },
				},
			},
		},
	})

	-- Enable the server
	vim.lsp.enable("vtsls")
end

return M
