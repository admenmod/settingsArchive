local cmd = vim.cmd
local g = vim.g
local opt = vim.opt


-- main setup

opt.number = true
opt.relativenumber = true
opt.undofile = true
opt.cursorline = true
opt.colorcolumn = '120' --'80'
opt.autoindent = true
-- opt.so = 999
opt.splitright = true
opt.splitbelow = true
opt.spelllang= { 'en_us', 'ru' }

opt.hidden = true
opt.mouse = 'a'
opt.inccommand = 'nosplit'
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.encoding = 'utf-8'
opt.ai = true
opt.compatible = false
opt.ttyfast = true

opt.smarttab = true
opt.smartindent = true
opt.expandtab = false
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

-- opt.foldenable = false
opt.foldnestmax = 10
opt.foldlevel = 0
opt.foldcolumn = '3'
opt.foldmethod = 'manual'

-- opt.list = true
-- opt.listchars:append('eol:↵,tab:│—,multispace:│...,trail:~') --␣


opt.termguicolors = true
opt.pumblend = 15

-- vim.o.completeopt = 'menuone,noselect'
-- vim.o.completeopt = 'longest,menuone'
-- cmd 'set completeopt-=preview'

-- 'skanehira/translate.vim'
g.translate_source = 'en'
g.translate_target = 'ru'

-- 'majutsushi/tagbar'
g.tagbar_compact = 0
g.tagbar_sort = 0

-- setup vscode theme
g.vscode_style = "dark"
g.vscode_transparency = 1
g.vscode_italic_comment = 0

-- coc.nvim
-- cmd([[
-- let g:coc_global_extensions = [ 'coc-json', 'coc-markdownlint', 'coc-vimlsp', 'coc-syntax', 'coc-toml', 'coc-yaml', 'coc-explorer', 'coc-sh', 'coc-html', 'coc-css', 'coc-snippets', 'coc-highlight', 'coc-calc', 'coc-tsserver', 'coc-git', 'coc-perl', 'coc-pyright', 'coc-lua', 'coc-fzf-preview', 'coc-rls', 'coc-cl', 'coc-clangd', 'coc-go', 'coc-godot' ]
-- ]])

-- exec vim cmd
cmd([[
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
]])

-- set theme
cmd([[
syntax enable
colorscheme vscode
]])



require('config/nvim-tree')
require('config/lualine')
require('config/bufferline')
require('config/nvim-treesitter')

cmd 'source ~/.config/nvim/lua/config/coc.nvim.vim'
cmd 'source ~/.config/nvim/lua/config/vim-startify.vim'
