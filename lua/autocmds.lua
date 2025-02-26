vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- reload kitty when/if config file changes
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = vim.fn.expand("$HOME/.config/kitty/kitty.conf"),
	command = "silent !kill -SIGUSR1 $(pgrep kitty)",
})

