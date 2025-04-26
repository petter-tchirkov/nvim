-- Enable persistent command history
vim.opt.history = 1000 -- Keep 1000 lines of command history

-- Faster completion (default is 4000ms)
vim.opt.updatetime = 300

-- Reduce time for which-key or CursorHold events
vim.opt.timeoutlen = 500 -- Time in milliseconds to wait for a mapped sequence to complete

-- Highlight search matches as you type
vim.opt.incsearch = true

-- Disable swapfile creation
vim.opt.swapfile = false

-- Reduce redraw time for better performance
vim.opt.lazyredraw = true

-- Enable clipboard integration
-- vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard

-- Set the command height for better visibility
vim.opt.cmdheight = 0 -- More space for displaying messages

-- Enable true color support
vim.opt.termguicolors = true

-- Set the maximum width of text for wrapping
vim.opt.textwidth = 80 -- Automatically wrap text at 80 characters

-- Display column for maximum line length
-- vim.opt.colorcolumn = "80" -- Highlight column 80 for better code readability

-- Disable wrapping of lines
vim.opt.wrap = false -- Prevent line wrapping

-- Enable hidden buffers
vim.opt.hidden = true -- Allow switching buffers without saving

-- Display matching parentheses
vim.opt.showmatch = true -- Highlight matching parenthesis

-- Set wildmenu for better command-line completion
vim.opt.wildmenu = true -- Enhanced command-line completion
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode

-- Enable split window resizing with equal proportions
vim.opt.equalalways = false -- Don't resize splits automatically

vim.opt.cursorline = true
vim.opt.laststatus = 3


