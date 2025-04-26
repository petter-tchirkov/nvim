return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8', -- Use the latest stable release
	dependencies = { 'nvim-lua/plenary.nvim' }, -- Required dependency
	config = function()
		local telescope = require('telescope')
		local builtin = require('telescope.builtin')
		local actions = require('telescope.actions')

		-- Basic setup
		telescope.setup({
			defaults = {
				layout_config = {
					horizontal = {
						width = 0.9, -- Adjust the width (90% of the editor width)
						height = 0.8, -- Adjust the height (80% of the editor height)
						preview_width = 0.5, -- Adjust the preview window width (50% of the Telescope window)
					},
					vertical = {
						width = function(_, max_columns)
							local percentage = 0.5
							local max = 70
							return math.min(math.floor(percentage * max_columns), max)
						end,
						height = function(_, _, max_lines)
							local percentage = 0.5
							local min = 70
							return math.max(math.floor(percentage * max_lines), min)
						end,
						preview_height = 0.5, -- Adjust the preview window height (50% of the Telescope window)
					},
					width = 0.85, -- Default width for all layouts
					height = 0.75, -- Default height for all layouts
					preview_cutoff = 120, -- Hide preview for small windows
				},
			},
			pickers = {
				find_files = {
					theme = 'dropdown',
					layout_config = {
						width = 0.5, -- Specific width for the `find_files` picker
						height = 0.6, -- Specific height for the `find_files` picker
					},
				},
			},
			extensions = {
				-- Add extensions here if needed
			},
		})

		-- Keybindings for common pickers
		vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Buffers' })
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
		vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Find Diagnostics' })
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'List buffers' })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Search help tags' })
		vim.keymap.set('n', '<leader>fp', builtin.highlights, { desc = 'Search highlights' })
	end,
}
