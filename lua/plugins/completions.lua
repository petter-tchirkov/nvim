-- return {
--         'hrsh7th/nvim-cmp',
--         enabled = true,
--         dependencies = {
--                 'hrsh7th/cmp-nvim-lsp',
--                 'L3MON4D3/luaSnip',
--                 'saadparwaiz1/cmp_luasnip',
--                 "hrsh7th/cmp-path",
--                 "hrsh7th/cmp-cmdline",
--                 "rafamadriz/friendly-snippets"
--         },
--         config = function()
--                 local status_cmp_ok, cmp = pcall(require, "cmp")
--                 local status_luasnip_ok, luasnip = pcall(require, "luasnip")
--
--                 require('nvim-autopairs').setup()
--                 local cmp_autopairs = require('nvim-autopairs.completion.cmp')
--                 local status_autopairs_ok, autopairs = pcall(require, " nvim-autopairs.completion.cmp")
--                 if not (status_cmp_ok or status_luasnip_ok) then
--                         print("CMP not loaded")
--                         vim.notify("CMP not working", "warn")
--                         return
--                 end
--
--                 luasnip.config.setup({})
--                 require('luasnip.loaders.from_vscode').lazy_load()
--                 local check_backspace = function()
--                         local col = vim.fn.col(".") - 1
--                         return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
--                 end
--
--                 local kind_icons = {
--                         Text = "",
--                         Method = "",
--                         Function = "",
--                         Constructor = "",
--                         Field = "",
--                         Variable = "",
--                         Class = "",
--                         Interface = "",
--                         Module = "",
--                         Property = "",
--                         Unit = "",
--                         Value = "",
--                         Enum = "",
--                         Keyword = "",
--                         Snippet = "",
--                         Color = "",
--                         File = "",
--                         Reference = "",
--                         Folder = "",
--                         EnumMember = "",
--                         Constant = "",
--                         Struct = "",
--                         Event = "",
--                         Operator = "",
--                         TypeParameter = "",
--                 }
--
--                 cmp.setup({
--                         snippet = {
--                                 expand = function(args)
--                                         luasnip.lsp_expand(args.body) -- For `luasnip` users.
--                                 end,
--                         },
--                         mapping = cmp.mapping.preset.insert({
--                                 -- ['<C-d>'] = cmp.mapping.scroll_docs( -4),
--                                 -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
--                                 -- ['<CR>'] = cmp.mapping.confirm {
--                                 --   behavior = cmp.ConfirmBehavior.Replace,
--                                 --   select = true,
--                                 -- },
--                                 ["<C-k>"] = cmp.mapping.select_prev_item(),
--                                 ["<C-j>"] = cmp.mapping.select_next_item(),
--                                 ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
--                                 ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
--                                 ["<C-Space>"] = cmp.mapping(cmp.mapping.complete({}), { "i", "c" }),
--                                 ["<C-e>"] = cmp.mapping({
--                                         i = cmp.mapping.abort(),
--                                         c = cmp.mapping.close(),
--                                 }),
--                                 -- Accept currently selected item. If none selected, `select` first item.
--                                 -- Set `select` to `false` to only confirm explicitly selected items.
--                                 ["<CR>"] = cmp.mapping.confirm({ select = true }),
--                                 ["<Tab>"] = cmp.mapping(function(fallback)
--                                         if cmp.visible() then
--                                                 cmp.select_next_item()
--                                         elseif luasnip.expandable() then
--                                                 luasnip.expand()
--                                         elseif luasnip.expand_or_jumpable() then
--                                                 luasnip.expand_or_jump()
--                                         elseif check_backspace() then
--                                                 fallback()
--                                         else
--                                                 fallback()
--                                         end
--                                 end, {
--                                         "i",
--                                         "s",
--                                 }),
--                                 ["<S-Tab>"] = cmp.mapping(function(fallback)
--                                         if cmp.visible() then
--                                                 cmp.select_prev_item()
--                                         elseif luasnip.jumpable(-1) then
--                                                 luasnip.jump(-1)
--                                         else
--                                                 fallback()
--                                         end
--                                 end, {
--                                         "i",
--                                         "s",
--                                 }),
--                         }),
--                         formatting = {
--                                 fields = { "kind", "abbr", "menu" },
--                                 format = function(entry, vim_item)
--                                         vim_item.kind = kind_icons[vim_item.kind]
--                                         vim_item.menu = ({
--                                                 nvim_lsp = "LSP",
--                                                 codeium = "Codeium",
--                                                 luasnip = "SNIP",
--                                                 nvim_lua = "LUA",
--                                                 buffer = "BUFF",
--                                                 path = "DIR",
--                                                 emoji = "EMOJI",
--                                         })[entry.source.name]
--                                         return vim_item
--                                 end,
--                         },
--                         sources = {
--                                 { name = "nvim_lsp" },
--                                 { name = "luasnip" },
--                                 -- { name = "codeium" },
--                                 { name = "nvim_lua" },
--                                 { name = "buffer" },
--                                 { name = "path" },
--                         },
--                         confirm_opts = {
--                                 behavior = cmp.ConfirmBehavior.Replace,
--                                 select = false,
--                         },
--                         window = {
--                                 completion = cmp.config.window.bordered(),
--                                 documentation = cmp.config.window.bordered(),
--                         },
--                         experimental = {
--                                 ghost_text = true
--                         },
--                 })
--         end
-- }

return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = { "rafamadriz/friendly-snippets", "onsails/lspkind.nvim" },

	-- use a release tag to download pre-built binaries
	version = "*",
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- See the full "keymap" documentation for information on defining your own keymap.
		keymap = {
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },
			["<CR>"] = { "accept", "fallback" },

			["<Tab>"] = {
				function(cmp)
					return cmp.select_next()
				end,
				"snippet_forward",
				"fallback",
			},
			["<S-Tab>"] = {
				function(cmp)
					return cmp.select_prev()
				end,
				"snippet_backward",
				"fallback",
			},

			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },
			["<C-up>"] = { "scroll_documentation_up", "fallback" },
			["<C-down>"] = { "scroll_documentation_down", "fallback" },
		},

		cmdline = {
			enabled = false,
		},

		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- Will be removed in a future release
			use_nvim_cmp_as_default = true,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			-- default = { "lsp", "path", "snippets", "buffer" },
			default = { "lsp", "buffer" },
			providers = {
				lsp = {
					min_keyword_length = 1, -- Number of characters to trigger porvider
					score_offset = 0, -- Boost/penalize the score of the items
				},
				path = {
					min_keyword_length = 0,
				},
				snippets = {
					min_keyword_length = 3,
				},
				buffer = {
					min_keyword_length = 2,
				},
			},
		},
		completion = {
			accept = {
				auto_brackets = {
					enabled = true,
				},
			},

			list = {
				selection = {
					preselect = function(ctx)
						return ctx.mode == "cmdline" and "auto_insert" or "preselect"
					end,
				},
			},
			--
			menu = {
				border = "rounded",

				cmdline_position = function()
					if vim.g.ui_cmdline_pos ~= nil then
						local pos = vim.g.ui_cmdline_pos -- (1, 0)-indexed
						return { pos[1] - 1, pos[2] }
					end
					local height = (vim.o.cmdheight == 0) and 1 or vim.o.cmdheight
					return { vim.o.lines - height, 0 }
				end,

				draw = {
					columns = {
						{ "kind_icon", "label", gap = 1 },
						{ "kind" },
					},
					components = {
						kind_icon = {
							text = function(item)
								local kind = require("lspkind").symbol_map[item.kind] or ""
								return kind .. " "
							end,
							highlight = "CmpItemKind",
						},
						label = {
							text = function(item)
								return item.label
							end,
							highlight = "CmpItemAbbr",
						},
						kind = {
							text = function(item)
								return item.kind
							end,
							highlight = "CmpItemKind",
						},
					},
				},
			},
		},
	},
	opts_extend = { "sources.default" },
}
