vim.g.mapleader = " "

--general
vim.opt.autoindent = true
vim.opt.autoindent = true
vim.opt.smartindent = true

--updates current open file if its changed outside of current shell
vim.opt.autoread = true

--always show current position
vim.opt.ruler = true

--search opts
vim.opt.incsearch = true
vim.opt.showmatch = true
vim.opt.hlsearch = false

--number of lines/columns to keep to above/below and right/left of cursor
vim.opt.scrolloff = 20
vim.opt.sidescrolloff = 20

--auto linebreak and line wrapping
vim.opt.wrap = true
vim.opt.lbr = true
vim.opt.tw = 80

--tab to spaces
vim.opt.expandtab = true
vim.opt.smarttab = true

--4 character tab
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.cmd([[
    set number
    augroup numbertoggle
        autocmd!
        autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
        autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
    augroup end
]])
