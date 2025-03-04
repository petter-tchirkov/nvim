return {
	{
		"akinsho/bufferline.nvim",
		-- version = '*',
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			vim.opt.termguicolors = true
			require("bufferline").setup({
				vim.keymap.set({ "n" }, "<S-l>", "<cmd>BufferLineCycleNext<CR>"),
				vim.keymap.set({ "n" }, "<S-h>", "<cmd>BufferLineCyclePrev<CR>"),
				vim.keymap.set({ "n" }, "<Leader>x", "<cmd>bd<CR>"),
			})
		end,
	},
}
