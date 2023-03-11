local map = vim.keymap.set

map('n', '<bs>', ':b#<cr>')
map('n', '<bs>', ':b#<cr>')
map('n', '<UP>', '<CMD>cope<CR>')
map('n', '<DOWN>', '<CMD>cclose<CR>')
map('n', '<RIGHT>', '<CMD>cnext<CR>')
map('n', '<LEFT>', '<CMD>cprev<CR>')
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')
map('n', 'g;', 'g;zz')
map('n', 'g,', 'g,zz')
map('n', '<C-o>', '<C-o>zz')
map('n', '<C-i>', '<C-i>zz')
map('n', '*', '*zz')
map('n', '#', '#zz')
map('n', '<esc>', '<CMD>nohlsearch<CR>')

map('n', '<leader>_', ':silent grep ', { silent = false })
map('n', '<leader>g', ':G<CR>')

map('n', '<M-s>', ':Neoformat | :w<CR>')
map('n', '<M-w>', ':q<CR>')
