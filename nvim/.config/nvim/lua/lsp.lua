local lsp_config = require('lspconfig')
local on_attach = function(client, buffer_nr) 
	vim.keymap.set('n', '<cr>', vim.lsp.buf.definition, { buffer = buffer_nr })
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = buffer_nr })

	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = formatting_augrop, buffer = buffer })
		vim.api.nvim_create_autocmd('BufWritePre', {
			group = formatting_augrop,
			buffer = buffer,
			callback = function() vim.lsp.buf.format() end
		})
	end
end

lsp_config.elixirls.setup({ cmd = { vim.loop.os_homedir() .. '/.local/share/elixir-ls/rel/language_server.sh' }, on_attach = on_attach, capabilities = require('cmp_nvim_lsp').default_capabilities() })

lsp_config.tsserver.setup({ on_attach = on_attach })
