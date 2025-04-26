local servers = {
	"lua_ls",
	"vtsls",
	"biome",
	-- Add more servers here
}

for _, server in ipairs(servers) do
	local ok, config = pcall(require, "lsp.servers." .. server)
	if ok and config.setup then
		config.setup()
	else
		-- Notify the user of the error
		local error_message = "Failed to load configuration for " .. server .. ": " .. tostring(config)
		vim.notify(error_message, vim.log.levels.ERROR)
	end
end
