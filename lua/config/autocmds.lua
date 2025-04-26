-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Print LSPs
vim.api.nvim_create_user_command("PrintLSPClients", function()
	-- Get all active LSP clients
	local clients = vim.lsp.get_clients({buffer = buffnr})
	local client_names = {}

	for _, client in ipairs(clients) do
		table.insert(client_names, client.name)
	end

	-- Create a new scratch buffer
	local buf = vim.api.nvim_create_buf(false, true) -- (listed = false, scratch = true)
	vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe") -- Automatically delete buffer when closed

	-- Set the content of the buffer
	if #client_names > 0 then
		vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "Active LSP Clients:" })
		vim.api.nvim_buf_set_lines(buf, 1, -1, false, client_names)
	else
		vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "No active LSP clients found." })
	end

	-- Open the buffer in a new split window
	vim.api.nvim_command("split")
	vim.api.nvim_set_current_buf(buf)
end, {})


  local format_summary = function(data)
    local summary = vim.b[data.buf].minidiff_summary
    local t = {}
    if summary.add > 0 then table.insert(t, string.format("%%#diffAdded#%s%%*", '+' .. summary.add)) end
    if summary.change > 0 then table.insert(t, string.format("%%#diffChanged#%s%%*", '~' .. summary.change)) end
    if summary.delete > 0 then table.insert(t, string.format("%%#diffRemoved#%s%%*",'-' .. summary.delete)) end
    vim.b[data.buf].minidiff_summary_string = table.concat(t, ' ')
  end
  local au_opts = { pattern = 'MiniDiffUpdated', callback = format_summary }
  vim.api.nvim_create_autocmd('User', au_opts)

