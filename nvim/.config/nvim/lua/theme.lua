vim.cmd("colorscheme nord")

-- Dump all highlight groups and links based on theme:
-- so $VIMRUNTIME/syntax/hitest.vim
vim.cmd("hi! link NormalFloat Visual")
vim.cmd("hi! link NvimTreeWindowPicker LeapLabelSecondary")
vim.cmd("hi! @error guibg=NONE gui=italic")
