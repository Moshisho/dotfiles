return {
	"mfussenegger/nvim-lint",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local lint = require("lint")
		local golint = require("lint").linters.golangcilint

		-- Add custom Biome linter
		lint.linters.biome = {
			cmd = "biome",
			stdin = true,
			args = {
				"lint",
				"--reporter=json",
				"--stdin-file-path",
				function()
					return vim.api.nvim_buf_get_name(0)
				end,
			},
			stream = "stdout",
			ignore_exitcode = true,
			parser = function(output, bufnr)
				if output == "" then
					return {}
				end
				
				local ok, decoded = pcall(vim.json.decode, output)
				if not ok or not decoded or not decoded.diagnostics then
					return {}
				end
				
				local diagnostics = {}
				for _, diagnostic in ipairs(decoded.diagnostics) do
					if diagnostic.location and diagnostic.location.span then
						local span = diagnostic.location.span
						table.insert(diagnostics, {
							lnum = span.start.line - 1, -- Convert to 0-based
							col = span.start.column,
							end_lnum = span["end"].line - 1,
							end_col = span["end"].column,
							severity = diagnostic.severity == "error" and vim.diagnostic.severity.ERROR 
								or diagnostic.severity == "warning" and vim.diagnostic.severity.WARN
								or vim.diagnostic.severity.INFO,
							message = diagnostic.description,
							code = diagnostic.category,
							source = "biome",
						})
					end
				end
				return diagnostics
			end,
		}

		golint.args = {
			"run",
			"--output.json.path=stdout",
			"--issues-exit-code=0",
			"--show-stats=false",
			function()
				return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
			end,
		}

		lint.linters_by_ft = {
			javascript = { "biome" },
			typescript = { "biome" },
			javascriptreact = { "biome" },
			typescriptreact = { "biome" },
			svelte = { "eslint_d" },
			python = { "pylint" },
			terraform = { "terraform_validate" },
			tf = { "terraform_validate" },
			go = { "golangcilint" },
			yaml = { "yamllint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>cl", function()
			lint.try_lint()
		end, { desc = "Lint" })
	end,
}
