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
opt.so = 0
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
opt.softtabstop=4

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
cmd([[
let g:coc_global_extensions = [ 'coc-json', 'coc-markdownlint', 'coc-vimlsp', 'coc-syntax', 'coc-toml', 'coc-yaml', 'coc-explorer', 'coc-sh', 'coc-html', 'coc-css', 'coc-snippets', 'coc-highlight', 'coc-calc', 'coc-tsserver', 'coc-git', 'coc-perl', 'coc-pyright', 'coc-lua', 'coc-fzf-preview', 'coc-rls', 'coc-cl', 'coc-clangd', 'coc-go', 'coc-godot' ]
]])

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

" #aaeeff
" highlight Folded guibg=#222211 guifg=#aa9977

highlight Folded gui=italic guibg=#222211 guifg=#eecc77
highlight FoldColumn guifg=#aa7733
highlight CursorLineNr guifg=#cccc33
highlight BufferLineBuffer guifg=#6a9955 guibg=#771616

" highlight! link TSVariableBuiltin TSConstructor
highlight! link TSVariableBuiltin TSKeyword
]])


-- lualine
require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = false,
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {
			function() return vim.api.nvim_eval('@%') end
		},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	extensions = {}
}

-- bufferline
require('bufferline').setup {
	options = {
		mode = "buffers", -- "buffers" | set to "tabs" to only show tabpages instead
		numbers = "both", -- "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
		close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
		right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
		left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
		middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
		-- NOTE: this plugin is designed with this icon in mind,
		-- and so changing this is NOT recommended, this is intended
		-- as an escape hatch for people who cannot bear it for whatever reason
		indicator_icon = '▎',
		buffer_close_icon = '',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		--- name_formatter can be used to change the buffer's label in the bufferline.
		--- Please note some names can/will break the
		--- bufferline so use this at your discretion knowing that it has
		--- some limitations that will *NOT* be fixed.
		name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
			-- remove extension from markdown files for example
			if buf.name:match('%.md') then
				return vim.fn.fnamemodify(buf.name, ':t:r')
			end
		end,
		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		tab_size = 18,
		diagnostics = "coc", -- false | "nvim_lsp" | "coc",
		diagnostics_update_in_insert = false,
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			return "("..count..")" -- ..diagnostics_dict..'|'..context
		end,
		-- NOTE: this will be called a lot so don't do any heavy processing here
		custom_filter = function(buf_number, buf_numbers)
			-- filter out filetypes you don't want to see
			if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
				return true
			end
			-- filter out by buffer name
			if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
				return true
			end
			-- filter out based on arbitrary rules
			-- e.g. filter out vim wiki buffer from tabline in your work repo
			if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
				return true
			end
			-- filter out by it's index number in list (don't show first buffer)
			if buf_numbers[1] ~= buf_number then
				return true
			end
		end,
		offsets = {{filetype = "NvimTree", text = "File Explorer" --[[ text = "File Explorer" | function , text_align = "left" | "center" | "right" ]]}},
		color_icons = true, -- true | false, -- whether or not to add the filetype icon highlights
		show_buffer_icons = true, -- true | false, -- disable filetype icons for buffers
		show_buffer_close_icons = true, -- true | false,
		show_buffer_default_icon = true, -- true | false, -- whether or not an unrecognised filetype should show a default icon
		show_close_icon = true, -- true | false,
		show_tab_indicators = true, -- true | false,
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		-- can also be a table containing 2 custom separators
		-- [focused and unfocused]. eg: { '|', '|' }
		separator_style = "slant", -- "slant" | "thick" | "thin" | { 'any', 'any' },
		enforce_regular_tabs = true, -- false | true,
		always_show_bufferline = true, -- true | false,
		sort_by = 'id', --[[ 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
			-- add custom logic
			return buffer_a.modified > buffer_b.modified
		end
		]]
	}
}


-- nvim-treesitter
local nvim_treesitter = require('nvim-treesitter')

nvim_treesitter.setup {
	install = {
		prefer_git = true,
		compilers = { 'clang' }
	},

	-- One of "all", "maintained" (parsers with maintainers), or a list of languages
	ensure_installed = {
		'vim', 'regex', 'http', 'bash', 'markdown', 'html', 'css', 'json', 'yaml', 'comment', 'dockerfile', 'help',
		'javascript', 'typescript', 'python', 'java', 'kotlin', 'lua', 'php',
		'c', 'cpp', 'c_sharp', 'rust', 'perl', 'dart', 'go', 'scala', 'haskell',
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
		additional_vim_regex_highlighting = true
	}
}


cmd [[
source ~/.config/nvim/lua/config/coc.nvim.vim
source ~/.config/nvim/lua/config/vim-startify.vim
]]


--[[
-- LSP settings

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end


local lspconfig = require("lspconfig")

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.setup {}


local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = lsp_installer.get_installed_servers()

for _, lsp in ipairs(servers) do
	if lsp == 'sumneko_lua' then goto continue end

	lspconfig[lsp.name].setup {
		on_attach = on_attach,

		flags = {
			debounce_text_changes = 150,
		},

		capabilities = capabilities
	}

	::continue::
end


lspconfig.sumneko_lua.setup {
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the 'vim', 'use' global
				globals = {'vim', 'use'},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		}
	}
}



-- luasnip setup
local luasnip = require('luasnip')
-- nvim-cmp setup
local cmp = require('cmp')
cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete({}),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'path' },
		{ name = 'buffer', options = {
			get_bufnrs = function()
				return vim.api.nvim_list_bufs()
			end
		},},
	},
}
--]]

