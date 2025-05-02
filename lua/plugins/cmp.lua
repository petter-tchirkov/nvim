---@diagnostic disable: missing-fields
return {
	{
		"saghen/blink.cmp",
		lazy = true,
		dependencies = {
			"folke/lazydev.nvim",
			"L3MON4D3/LuaSnip",
		},
		event = "InsertEnter",
		-- use a release tag to download pre-built binaries
		version = "v1.*",
		-- Or build from source
		-- build = "cargo build --release",
		-- optional: provides snippets for the snippet source
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		-- Refer https://cmp.saghen.dev/installation.html
		opts = {
			keymap = {
				preset = "enter",
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab"] = { "select_prev", "fallback" },
			},
			completion = {
				-- Controls whether the documentation window will automatically show when selecting a completion item
				documentation = {
					auto_show = true,
				},
			},
			-- Experimental signature help support
			signature = {
				enabled = false,
			},
			appearance = {
				-- Sets the fallback highlight groups to nvim-cmp's highlight groups
				-- Useful for when your theme doesn't support blink.cmp
				-- Will be removed in a future release
				use_nvim_cmp_as_default = true,
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			-- Disable cmdline completions
			cmdline = {
				enabled = true,
			},
			snippets = { preset = "luasnip" },
		},
		-- without having to redefine it
		opts_extend = {
			"sources.completion.enabled_providers",
			"sources.default",
		},
	},
	-- lazydev
	{
		"saghen/blink.cmp",
		opts = {
			sources = {
				-- add lazydev to your completion providers
				default = { "lazydev" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100, -- show at a higher priority than lsp
					},
				},
			},
		},
	},
}
