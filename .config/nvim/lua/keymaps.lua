local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }


map('n', '<leader>l', ':nohlsearch<CR>', default_opts)
map('v', '<leader>/', 'y/\\V<C-r>"<CR>', default_opts)


map('n', '<C-t>', ':NvimTreeToggle<CR>', default_opts)
map('n', '<C-l>', ':UndotreeToggle<CR>', default_opts)
map('n', '<C-b>', ':TagbarToggle<CR>', default_opts)

map('i', '<C-_>', '<Esc><Esc>gcci', {})

map('n', '<A-Up>',   ':m .-2<CR>==', default_opts)
map('n', '<A-Down>', ':m .+1<CR>==', default_opts)
map('i', '<A-Up>',   '<Esc><Esc>:m .-2<CR>==gi', default_opts)
map('i', '<A-Down>', '<Esc><Esc>:m .+1<CR>==gi', default_opts)
map('v', '<A-Up>',   ':m \'<-2<CR>gv=gv', default_opts)
map('v', '<A-Down>', ':m \'>+1<CR>gv=gv', default_opts)

map('v', 'Y', '"*y', {})
map('v', '<leader>y', '"*y', default_opts)
map('n', '<leader>p', '"*p', default_opts)

map('n', '<Tab>', ':BufferLineCycleNext<CR>', default_opts)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', default_opts)

map('v', '<C-t>', '<Plug>(VTranslate)', {})

map('n', '<C-a>', [[ <cmd>lua require('telescope.builtin').find_files()<cr> ]], default_opts)
map('n', '<C-p>', [[ <cmd>lua require('telescope.builtin').buffers()<cr> ]], default_opts)

