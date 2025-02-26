return {
	"rmagatti/auto-session",
	lazy = false,

	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		-- bypass_session_save_file_types = 'Lazy', -- table: Bypass auto save when only buffer open is one of these file types
		log_level = "error",
		auto_session_suppress_dirs = {
			"~/",
			"~/Projects",
			"~/Downloads",
			"/",
			"~/Code",
			"~/Music",
		},
		cwd_change_handling = true,
		pre_cwd_changed_cmds = {
			"tabdo Neotree close", -- Close NERDTree before saving session
		},
		-- auto_session_pre_save_cmds = { "tabdo NERDTreeClose" },
		post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
			require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
		end,
	},
}
