"BASE SET
:set number
:set relativenumber
:set autoindent
:set smarttab
:set tabstop=4
:set shiftwidth=4
:set softtabstop=4
:set noexpandtab
:set mouse=a
:set t_Co=256
:set inccommand=nosplit
:set completeopt-=preview
:set nobackup
:set noswapfile
:set encoding=utf-8
:set ai
:set nocompatible
:set ttyfast
:set smartindent
:set hidden
:set colorcolumn=119 "79

"SET FOLD
:set foldnestmax=10
":set nofoldenable
:set foldlevel=0
:set foldcolumn=3
:set foldmethod=manual

"[help] ononeinit rename ?* loadview
augroup AutoSaveFolds
autocmd!
autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
autocmd BufWinEnter ?* silent! loadview
augroup end

"MAP
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :UndotreeToggle<CR>
nnoremap <C-b> :TagbarToggle<CR>

inoremap <C-c> <ESC><ESC>
inoremap <C-y> <ESC><ESC>ddi
inoremap <C-d> <ESC><ESC>yypi

nnoremap <A-UP> :m .-2<CR>==
nnoremap <A-DOWN> :m .+1<CR>==
inoremap <A-UP> <ESC><ESC>:m .-2<CR>==gi
inoremap <A-DOWN> <ESC><ESC>:m .+1<CR>==gi
vnoremap <A-UP> :m '<-2<CR>gv=gv
vnoremap <A-DOWN> :m '>+1<CR>gv=gv

"plug#begin
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'ap/vim-css-color'
Plug 'preservim/tagbar'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'Mofiqul/vscode.nvim'
Plug 'Mofiqul/dracula.nvim'
Plug 'mbbill/undotree'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'mkitt/tabline.vim'
Plug 'jrudess/vim-foldtext'
"Plug 'jiangmiao/auto-pairs'
Plug 'https://tpope.io/vim/fugitive.git'

Plug 'tpope/vim-commentary'

"Plug 'ur4ltz/surround.nvim'
Plug 'tpope/vim-surround'

call plug#end()

"let
let NERDTreeShowHidden = 1

"autocmd VimEnter *.py,*.pl,*.js,*.php TagbarToggle  
" Компактный вид у тагбара     
"let g:tagbar_compact = 1  
" Отк. сортировка по имени у тагбара (мне хронология важнее) 
let g:tagbar_sort = 0

"SAVEING ~/.UNDODIR
if has("persistent_undo")
   let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, 'p', 0700)
    endif

    let &undodir=target_path
    set undofile
endif

"SET SYNTAX & THEME
syntax on

let g:vscode_style = "dark"
" Enable transparent background.
let g:vscode_transparency = 1
" Enable italic comment
let g:vscode_italic_comment = 1

colorscheme vscode

:highlight Folded guibg='#222211' guifg='#aa9977'
"guibg='#222211' guifg='#eecc77'
" '#aaeeff'

"NVIM-TREESETTER.CONFIGS
lua <<EOF
require'nvim-treesitter.install'.prefer_git = true
require'nvim-treesitter.install'.compilers = { 'clang' }
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {
	  'vim', 'regex', 'http', 'bash', 'markdown', 'html', 'css', 'json', 'yaml', 'comment', 'dockerfile', 'help',
	  'javascript', 'typescript', 'python', 'java', 'kotlin', 'lua', 'php',
	  'c', 'cpp', 'c_sharp', 'rust', 'perl', 'dart', 'go', 'scala',
	  'vue', 'jsdoc', 'gdscript'
  },

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}
EOF

