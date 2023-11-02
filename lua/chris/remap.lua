vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Move text and auto indent
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<S-down>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', '<S-up>', ":m '<-2<CR>gv=gv")

-- curser stays when using J
vim.keymap.set('n', 'J', 'mzJ`z')
-- Curser in the middle when jumping
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
--
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Delete into void buffer and then paste
vim.keymap.set('x', '<leader>p', '"_dP')

-- Delete into void buffer
vim.keymap.set({ 'n', 'v' }, '<leader><C-d>', '"_d')

vim.keymap.set('n', 'Q', '<nop>')

-- Terminal --

-- Open Terminal
vim.keymap.set('n', '<C-A-t>', '<cmd>sp<CR><C-w>j<cmd>term<CR><cmd>res 6<CR>')

-- Exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Move in and out of splits
vim.keymap.set('n', '<A-up>', '<C-w>k')
vim.keymap.set('n', '<A-down>', '<C-w>j')
vim.keymap.set('n', '<A-left>', '<C-w>h')
vim.keymap.set('n', '<A-right>', '<C-w>l')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-l>', '<C-w>l')
-- Move in and out of splits while in terminal mode
vim.keymap.set('t', '<A-up>', '<C-\\><C-n><C-w>k')
vim.keymap.set('t', '<A-down>', '<C-\\><C-n><C-w>j')
vim.keymap.set('t', '<A-left>', '<C-\\><C-n><C-w>h')
vim.keymap.set('t', '<A-right>', '<C-\\><C-n><C-w>l')
vim.keymap.set('t', '<A-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set('t', '<A-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set('t', '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set('t', '<A-l>', '<C-\\><C-n><C-w>l')
