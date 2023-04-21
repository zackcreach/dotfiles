local lsp_config = require("lspconfig")
local on_attach = function(client, buffer_nr)
	vim.keymap.set("n", "<cr>", vim.lsp.buf.definition, { buffer = buffer_nr })
	vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buffer_nr })
end

lsp_config.elixirls.setup({
	cmd = { "/opt/homebrew/Cellar/elixir-ls/0.13.0/libexec/language_server.sh" },
	on_attach = on_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

lsp_config.tsserver.setup({ on_attach = on_attach })
