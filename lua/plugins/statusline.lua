return {
	{
		"echasnovski/mini.statusline",
		dependencies = { "echasnovski/mini.icons" },
		version = false,
		config = function()
			local MiniStatusline = require("mini.statusline")
			MiniStatusline.setup({
				content = {
					-- Define the active statusline
					active = function()
						local MiniStatusline = require("mini.statusline")
						local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
						local git = MiniStatusline.section_git({ trunc_width = 40 })
						local filename = MiniStatusline.section_filename({ trunc_width = 140 })
						local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
						return MiniStatusline.combine_groups({
							{ hl = mode_hl, strings = { mode:upper() } },
							{ hl = "MiniStatuslineDevinfo", strings = { git, diagnostics } },
							"%<", -- Mark general truncate point
							{ hl = "MiniStatuslineFilename", strings = { filename } },
							"%=", -- End left alignment
							{
								hl = "MiniStatuslineFileinfo",
								strings = {
									vim.bo.filetype ~= ""
										and require("mini.icons").get("filetype", vim.bo.filetype)
											.. " "
											.. vim.bo.filetype,
								},
							},
							{ hl = mode_hl, strings = { "%l:%v" } },
						})
					end,
				},
			})
		end,
	},
	{
		"echasnovski/mini-git",
		version = false,
		main = "mini.git",
		opts = {},
	},
	{
		"echasnovski/mini.diff",
		version = false,
		opts = {},
	},
}
