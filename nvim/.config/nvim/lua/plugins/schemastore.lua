return {
	"b0o/schemastore.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	config = function()
		local lspconfig = require("lspconfig")

		-- Configure JSON language server
		lspconfig.jsonls.setup({
			settings = {
				json = {
					-- Use schemastore.nvim for JSON schemas
					schemas = require("schemastore").json.schemas(),
					-- Enable validation
					validate = { enable = true },
				},
			},
		})
	end,
}
