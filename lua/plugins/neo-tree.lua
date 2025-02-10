return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
    config = function()
      require('neo-tree').setup {
        filesystem = {
          filtered_items = {
            visible = true,
            show_hidden_count = true,
            hide_dotfiles = false,
            hide_gitignored = true,
            hide_by_name = {
              '.git',
              '.DS_Store',
              'thumbs.db',
            },
            never_show = {},
          },
        },
        window = {
          position = 'right',
          width = 40,
          mapping_options = {
            noremap = false,
            nowait = true,
          },
          mappings = {
            ['l'] = 'open',
            ['h'] = 'close_node',
            ['<leader>e'] = 'close_window',
          },
        },
      }
      vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal right<CR>', { silent = true })
      vim.keymap.set('n', '<C-l>', '<cmd>winc l<CR>', {})
      vim.keymap.set('n', '<C-h>', '<cmd>winc h<CR>', {})
      vim.keymap.set('n', '<C-j>', '<cmd>winc j<CR>', {})
      vim.keymap.set('n', '<C-k>', '<cmd>winc k<CR>', {})
    end,
}
