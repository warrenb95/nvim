local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local util = require("vim.lsp.util")

null_ls.setup({
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					local params = util.make_formatting_params({})
					client.request("textDocument/formatting", params, nil, bufnr)
				end,
			})
		end
	end,
	debug = false,
	sources = {
		formatting.gofmt,
		formatting.goimports,
		formatting.stylua,
		formatting.protolint,
		formatting.markdownlint,
		formatting.sqlfull,
		formatting.terraform_fmt,
		diagnostics.golangci_lint,
		diagnostics.markdownlint,
		diagnostics.luacheck,
		diagnostics.protolint,
		diagnostics.sqlfluff,
	},
})
