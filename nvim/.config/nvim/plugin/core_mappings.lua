local map = vim.keymap.set

map("n", "<bs>", ":b#<CR>")
map("n", "<F1>", ":bprev<CR>")
map("n", "<F2>", ":bnext<CR>")
map("n", "<UP>", "<CMD>cope<CR>")
map("n", "<DOWN>", "<CMD>cclose<CR>")
map("n", "<RIGHT>", "<CMD>cnext<CR>")
map("n", "<LEFT>", "<CMD>cprev<CR>")
map("n", "n", "nzz")
map("n", "N", "Nzz")
map("n", "g;", "g;zz")
map("n", "g,", "g,zz")
map("n", "<C-o>", "<C-o>zz")
map("n", "<C-i>", "<C-i>zz")
map("n", "*", "*zz")
map("n", "#", "#zz")
map("n", "<esc>", "<CMD>nohlsearch<CR>")

map("t", "<ESC>", "<c-\\><c-n>", { silent = false })

-- Leader
map("n", "<leader>_", ":silent grep ", { silent = false })
map("n", "<leader>d", "<CMD>G<CR>")
map("n", "<leader>fr", "<CMD>lua vim.lsp.buf.references()<CR>")
map("n", "<leader>gl", "<CMD>Gclog<CR>")
map("n", "<leader>gh", "<CMD>0Gclog<CR>")
map("n", "<leader>gm", "<CMD>GitMessenger<CR>")
map("n", "<leader>gb", "<CMD>G blame<CR>")
map("n", "<leader>gw", "<CMD>Gwrite<CR>")
map("n", "<leader>gr", "<CMD>Gread<CR>")
map("n", "<leader>s", "<CMD>Neoformat | :w<CR>")
map("n", "<leader>w", "<CMD>q<CR>")

-- MacOS
map("n", "<M-f>", ":silent grep ", { silent = false })
map("n", "<M-d>", ":G<CR>")
map("n", "<M-s>", ":Neoformat | :w<CR>")
map("n", "<M-w>", ":q<CR>")
