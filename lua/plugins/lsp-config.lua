return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },

		lazy = false,
		vim.diagnostic.config({
			virtual_text = false,
		}),
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local vue_typescript_plugin_path = vim.fn.stdpath("data")
				.. "/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin"
			local lspconfig = require("lspconfig")
			local on_attach = function(client, bufnr)
				local opts = { noremap = true, silent = true, buffer = bufnr }

				--set keybind for go to definition
				keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			end

			lspconfig.ts_ls.setup({
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							-- location = "/home/theonlyvoivod/.nvm/versions/node/v22.13.1/lib/node_modules/@vue/typescript-plugin",
							location = vue_typescript_plugin_path,
							languages = { "vue" },
						},
					},
				},
				-- settings = {
				-- 	typescript = {
				-- 		tsserver = {
				-- 			useSyntaxServer = false,
				-- 		},
				-- 		inlayHints = {
				-- 			includeInlayParameterNameHints = "all",
				-- 			includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				-- 			includeInlayFunctionParameterTypeHints = true,
				-- 			includeInlayVariableTypeHints = true,
				-- 			includeInlayVariableTypeHintsWhenTypeMatchesName = true,
				-- 			includeInlayPropertyDeclarationTypeHints = true,
				-- 			includeInlayFunctionLikeReturnTypeHints = true,
				-- 			includeInlayEnumMemberValueHints = true,
				-- 		},
				-- 	},
				-- },
			})
			lspconfig.solargraph.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			})
			lspconfig.volar.setup({
				init_options = {
					vue = {
						hybridMode = false,
					},
				},
				settings = {
					typescript = {
						inlayHints = {
							enumMemberValues = {
								enabled = true,
							},
							functionLikeReturnTypes = {
								enabled = true,
							},
							propertyDeclarationTypes = {
								enabled = true,
							},
							parameterTypes = {
								enabled = true,
								suppressWhenArgumentMatchesName = true,
							},
							variableTypes = {
								enabled = true,
							},
						},
					},
				},
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				root_dir = lspconfig.util.root_pattern(
					"tailwind.config.js",
					"tailwind.config.ts",
					"tailwind.config.mjs"
				),
				settings = {
					tailwindCSS = {
						classAttributes = { ".*ClassName", "class" },
						experimental = {
							classRegex = {
								{
									"clsx\\(([^)]*)\\)",
									"(?:'|\"|`)([^']*)(?:'|\"|`)",
								},
							},
						},
					},
				},
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.o.updatetime = 250

			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				group = vim.api.nvim_create_augroup("float_diagnostic_cursor", { clear = true }),
				callback = function()
					vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
				end,
			})
			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					virtual_text = false,
				})
		end,
	},
}
