return {
	"echasnovski/mini.files",
	version = false,

  vim.keymap.set('n', '<leader>e', '<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0), false)<CR>'),

	opts = {
		mappings = {
			close = "q",
			go_in = "",
			go_in_plus = "l",
			go_out = "h",
			go_out_plus = "H",
			mark_goto = "'",
			mark_set = "m",
			reset = "<BS>",
			reveal_cwd = "@",
			show_help = "g?",
			synchronize = "=",
			trim_left = "<",
			trim_right = ">",
		},
	},
}
