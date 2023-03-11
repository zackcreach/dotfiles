-- Format on save
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	group = vim.api.nvim_create_augroup("fmt", { clear = true }),
-- 	command = "undojoin | Neoformat",
-- })

-- Force specific formatting engines
vim.g.neoformat_enabled_typescript = { "prettier" }
vim.g.neoformat_enabled_javascript = { "prettier" }
vim.g.neoformat_enabled_json = { "prettier" }
vim.g.neoformat_enabled_css = { "prettier" }
vim.g.neoformat_enabled_markdown = { "prettier" }
vim.g.neoformat_enabled_html = { "prettier" }
vim.g.neoformat_enabled_svelte = { "prettierd" }
vim.g.neoformat_enabled_lua = { "stylua" }
vim.g.neoformat_enabled_elixir = { "mixformat" }