return {
  'stevearc/conform.nvim',
  opts = {
	  formatters_by_ft = {
		  lua = { "stylua" },
		  typesctipt = {"biome"},
		  javascript = {"biome"},
		  vue = {"biome"},
	  },
	  format_on_save = {
		  -- These options will be passed to conform.format()
		  timeout_ms = 500,
		  lsp_format = "fallback",
	  },
  },
}
