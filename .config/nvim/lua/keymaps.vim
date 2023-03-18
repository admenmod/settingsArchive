nnoremap <leader>l :nohlsearch<CR>
vnoremap <leader>/ y/\\V<C-r>"<CR>
nnoremap <leader>s :%s/\v\s+$//g<CR>

nnoremap [o <cmd>bprevious<CR>
nnoremap ]o <cmd>bnext<CR>
nnoremap d<BS> <cmd>bdelete<CR>

nnoremap <C-t> <cmd>Neotree toggle<CR>
nnoremap <C-l> <cmd>UndotreeToggle<CR>
nnoremap <C-b> <cmd>TagbarToggle<CR>
nnoremap <C-h> <cmd>Gitsigns blame_line<CR>

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

nnoremap <silent> ,t :tabnew %<CR>
nnoremap <silent> ,cc :cclose<CR>
nnoremap <silent> ,co :copen<CR>

nnoremap <Tab> <cmd>BufferLineCycleNext<CR>
nnoremap <S-Tab> <cmd>BufferLineCyclePrev<CR>

vmap <C-t> <Plug>(VTranslate)

nnoremap ,fb <cmd>Telescope buffers<CR>
nnoremap ,ff <cmd>Telescope find_files<CR>
nnoremap ,fg <cmd>Telescope live_grep<CR>

" Switch buffers using keys
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

nnoremap <silent> [t :tabprevious<CR>
nnoremap <silent> ]t :tabnext<CR>
nnoremap <silent> [T :tabfirst<CR>
nnoremap <silent> ]T :tablast<CR>

nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [Q :cfirst<CR>
nnoremap <silent> ]Q :clast<CR>

nnoremap <silent> [l :lprevious<CR>
nnoremap <silent> ]l :lnext<CR>
nnoremap <silent> [L :lfirst<CR>
nnoremap <silent> ]L :llast<CR>
