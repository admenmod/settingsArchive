function! SetDefaultDirectory()
	let cwd = getcwd()
	if len(cwd) > 0
		let $NVIM_CWD = fnameescape(cwd)
		execute 'cd '.$NVIM_CWD
	endif
endfunction

augroup set_default_directory
	autocmd!
	autocmd BufNewFile * call SetDefaultDirectory()
augroup end

" default_directory
cd "${$NVIM_CWD}"'


augroup AutoSaveFolds
autocmd!
autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
autocmd BufWinEnter ?* silent! loadview
augroup end


"SAVEING ~/.UNDODIR
if has("persistent_undo")
	let target_path = expand('~/.undodir')

	if !isdirectory(target_path)
		call mkdir(target_path, 'p', 0700)
	endif

	let &undodir=target_path
	set undofile
endif

augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup end

augroup AutoTSEnable
autocmd!
autocmd VimEnter * TSEnable highlight indent incremental_selection
augroup end


syntax enable
colorscheme vscode


" set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,terminal
set sessionoptions=blank,buffers,curdir,help,tabpages,winsize,terminal

let g:rooter_resolve_links = 1
let g:rooter_patterns = ['.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json']

"let g:session_ignore_patterns = ['\(^.*\/neo-tree\/.*$\)']
"let g:session_autosave = 'no'

let g:nvim_tree_symlink_arrow = ' ➛ '

let g:neotree_default_open = 1
let g:neotree_follow_symlink = 1
let g:neotree_symlink_arrow = '->'
let g:neotree_file_icon_char_symlink = ''


"autocmd VimEnter * call co-neovim#activate()
