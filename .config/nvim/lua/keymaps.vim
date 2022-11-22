nnoremap <leader>l <cmd>nohlsearch<CR>
vnoremap <leader>/ y/\\V<C-r>"<CR>


nnoremap <C-t> <cmd>NvimTreeToggle<CR>
nnoremap <C-l> <cmd>UndotreeToggle<CR>
nnoremap <C-b> <cmd>TagbarToggle<CR>

" nnoremap ]<space> @="\"=\"\\"\n"<CR>p
nnoremap <silent> ]<space> "="\n"<CR>]p
nnoremap <silent> [<space> "="\n"<CR>[p


imap <C-_> <Esc><Esc>gcci

nnoremap <silent> <A-Up>      :m .-2<CR>==
nnoremap <silent> <A-Down>    :m .+1<CR>==
inoremap <silent> <A-Up>      <Esc><Esc>:m .-2<CR>==gi
inoremap <silent> <A-Down>    <Esc><Esc>:m .+1<CR>==gi
vnoremap <silent> <A-Up>      :m '<-2<CR>gv=gv
vnoremap <silent> <A-Down>    :m '>+1<CR>gv=gv

vmap Y "*y
vnoremap <leader>y "*y
nnoremap <leader>p "*p

nnoremap <Tab> <cmd>BufferLineCycleNext<CR>
nnoremap <S-Tab> <cmd>BufferLineCyclePrev<CR>

vmap <C-t> <Plug>(VTranslate)

nnoremap ,fb <cmd>Telescope buffers<CR>
nnoremap ,ff <cmd>Telescope find_files<CR>
nnoremap ,fg <cmd>Telescope live_grep<CR>

