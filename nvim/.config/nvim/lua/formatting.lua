-- Format on save
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	group = vim.api.nvim_create_augroup("fmt", { clear = true }),
-- 	command = "undojoin | Neoformat",
-- })

-- Force specific formatting engines
vim.g.neoformat_enabled_typescript = { "prettierd" }
vim.g.neoformat_enabled_javascript = { "prettierd" }
vim.g.neoformat_enabled_json = { "prettierd" }
vim.g.neoformat_enabled_css = { "prettierd" }
vim.g.neoformat_enabled_markdown = { "prettierd" }
vim.g.neoformat_enabled_html = { "prettierd" }
vim.g.neoformat_enabled_svelte = { "prettierd" }
vim.g.neoformat_enabled_lua = { "stylua" }
vim.g.neoformat_enabled_elixir = { "mixformat" }
