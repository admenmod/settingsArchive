nnoremap <silent> <leader>l :nohlsearch<CR>
vnoremap <silent> <leader>/ y/\\V<C-r>"<CR>


nnoremap <silent> <C-t> :NvimTreeToggle<CR>
nnoremap <silent> <C-l> :UndotreeToggle<CR>
nnoremap <silent> <C-b> :TagbarToggle<CR>

" nnoremap ]<space> @="\"=\"\\"\n"<CR>p
nnoremap <silent> ]<space> "="\n"<CR>]p
nnoremap <silent> [<space> "="\n"<CR>[p


imap <C-_> <Esc><Esc>gcci

nnoremap <silent> <A-Up>      :m .-2<CR>==
nnoremap <silent> <A-Down>    :m .+1<CR>==
inoremap <silent> <A-Up>      <Esc><Esc>:m .-2<CR>==gi
inoremap <silent> <A-Down>    <Esc><Esc>:m .+1<CR>==gi
vnoremap <silent> <A-Up>      :m \'<-2<CR>gv=gv
vnoremap <silent> <A-Down>    :m \'>+1<CR>gv=gv

vmap Y "*y
vnoremap <silent> <leader>y "*y
nnoremap <silent> <leader>p "*p

nnoremap <silent> <Tab> :BufferLineCycleNext<CR>
nnoremap <silent> <S-Tab> :BufferLineCyclePrev<CR>

vmap <C-t> <Plug>(VTranslate)

nnoremap <silent> <C-a> :lua require('telescope.builtin').find_files()<CR>
nnoremap <silent> <C-p> :lua require('telescope.builtin').buffers()<CR>

