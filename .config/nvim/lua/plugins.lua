local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
	if vim.fn.input('Download Packer? (y for yes)') ~= 'y' then
		return
	end

	local directory = string.format(
		'%s/pack/packer/opt/',
		vim.fn.stdpath('config')
	)

	vim.fn.mkdir(directory, 'p')

	local out = vim.fn.system(string.format(
		'git clone %s %s',
		'https://github.com/wbthomason/packer.nvim',
		directory .. '/packer.nvim'
	))

	print(out)
	print('Downloading packer.nvim...')

	return
end


return require('packer').startup(function()
	use { 'wbthomason/packer.nvim', opt = true }

	use 'kyazdani42/nvim-web-devicons'


	use 'Mofiqul/vscode.nvim'
	use 'ap/vim-css-color'
	use 'jrudess/vim-foldtext'

	use 'mbbill/undotree'
	use 'skanehira/translate.vim'
	use 'tpope/vim-surround'
	use 'nvim-lua/popup.nvim'
	use 'google/vim-searchindex'
	use 'tpope/vim-repeat'
	use 'mhinz/vim-startify'
	use 'mattn/emmet-vim'

	use 'powerman/vim-plugin-ruscmd'
	use 'idanarye/breeze.vim'
	use 'alvan/vim-closetag'

	use 'metakirby5/codi.vim'

	use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
	use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons' }
	-- use { 'willothy/nvim-cokeline', requires = 'kyazdani42/nvim-web-devicons' }


	-- use { 'folke/trouble.nvim', requires = 'nvim-tree/nvim-web-devicons',
	-- config = function()
	-- 	require('trouble').setup {
	-- 		position = 'bottom', -- position of the list can be: bottom, top, left, right
	-- 		height = 4, -- height of the trouble list when position is top or bottom
	-- 		width = 50, -- width of the list when position is left or right
	-- 		icons = true, -- use devicons for filenames
	-- 		mode = 'quickfix', -- 'workspace_diagnostics', 'document_diagnostics', 'quickfix', 'lsp_references', 'loclist'
	-- 		fold_open = '', -- icon used for open folds
	-- 		fold_closed = '', -- icon used for closed folds
	-- 		group = true, -- group results by file
	-- 		padding = true, -- add an extra new line on top of the list
	-- 		action_keys = { -- key mappings for actions in the trouble list
	-- 		-- map to {} to remove a mapping, for example:
	-- 		-- close = {},
	-- 		close = 'q', -- close the list
	-- 		cancel = '<esc>', -- cancel the preview and get back to your last window / buffer / cursor
	-- 		refresh = 'r', -- manually refresh
	-- 		jump = {'<cr>', '<tab>'}, -- jump to the diagnostic or open / close folds
	-- 		open_split = { '<c-x>' }, -- open buffer in new split
	-- 		open_vsplit = { '<c-v>' }, -- open buffer in new vsplit
	-- 		open_tab = { '<c-t>' }, -- open buffer in new tab
	-- 		jump_close = {'o'}, -- jump to the diagnostic and close the list
	-- 		toggle_mode = 'm', -- toggle between 'workspace' and 'document' diagnostics mode
	-- 		toggle_preview = 'P', -- toggle auto_preview
	-- 		hover = 'K', -- opens a small popup with the full multiline message
	-- 		preview = 'p', -- preview the diagnostic location
	-- 		close_folds = {'zM', 'zm'}, -- close all folds
	-- 		open_folds = {'zR', 'zr'}, -- open all folds
	-- 		toggle_fold = {'zA', 'za'}, -- toggle fold of current file
	-- 		previous = 'k', -- previous item
	-- 		next = 'j' -- next item
	-- 	},
	-- 	indent_lines = true, -- add an indent guide below the fold icons
	-- 	auto_open = false, -- automatically open the list when you have diagnostics
	-- 	auto_close = false, -- automatically close the list when you have no diagnostics
	-- 	auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
	-- 	auto_fold = false, -- automatically fold a file trouble list at creation
	-- 	auto_jump = {'lsp_definitions'}, -- for the given modes, automatically jump if there is only a single result
	-- 	signs = {
	-- 		-- icons / text used for a diagnostic
	-- 		error = '',
	-- 		warning = '',
	-- 		hint = '',
	-- 		information = '',
	-- 		other = '﫠'
	-- 	},
	-- 	use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
	-- }
	-- end }

	use { 'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
		},

	config = function()
		local telescope = require('telescope')
		local actions = require('telescope.actions')

		require('telescope').setup({
			defaults = {
				mappings = {
					n = {
						['<C-q>'] = false,
						['<C-l>'] = actions.send_to_qflist + actions.open_qflist
					},
					i = {
						['<C-j>'] = actions.preview_scrolling_down,
						['<C-q>'] = false,
						['<C-l>'] = actions.send_to_qflist + actions.open_qflist
					}
				},
				p
			}
		})
	end }

	use 'folke/todo-comments.nvim'
	use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }

	use 'honza/vim-snippets'
	use 'SirVer/ultisnips'

	use 'airblade/vim-rooter'

	use 'https://tpope.io/vim/fugitive.git'
	use 'lewis6991/gitsigns.nvim'

	use { 'nvim-treesitter/nvim-treesitter', run = 'TSUpdate' }
	use { 'nvim-treesitter/playground' }

	use { 'neoclide/coc.nvim', branch = 'release' }

	-- use { 'nvimdev/lspsaga.nvim', after = 'nvim-lspconfig',
	-- 	config = function() require('lspsaga').setup({}) end
	-- }


	-- use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons', config = function()
	--	require('nvim-tree').setup({}) end
	-- }

	use {
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v2.x',
		requires = {
			'nvim-lua/plenary.nvim',
			'kyazdani42/nvim-web-devicons', -- not strictly required, but recommended
			'MunifTanjim/nui.nvim',
		}
	}

	-- use { 'folke/neodev.nvim', config = function ()
	-- 	-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
	-- 	require("neodev").setup({
	-- 		-- add any options here, or leave empty to use the default settings
	-- 	})
	--
	-- 	-- then setup your lsp server as usual
	-- 	local lspconfig = require('lspconfig')
	--
	-- 	-- example to setup lua_ls and enable call snippets
	-- 	lspconfig.lua_ls.setup({
	-- 		settings = {
	-- 			Lua = {
	-- 				completion = {
	-- 					callSnippet = "Replace"
	-- 				}
	-- 			}
	-- 		}
	-- 	})
	-- end }


	-- use { '~/workdir/co-neovim' }

	-- use '~/workdir/co-neovim/'

	-- use { 'floobits/floobits-neovim' } --, run = 'floobits fetch' }

	-- use {
	-- 	'FredKSchott/CoVim',
	-- 	run = 'make',
	-- 	config = function()
	-- 		vim.g.CoVimServerMaxSize = 1024 * 1024 * 5 -- установка максимального размера файла в 5 МБ
	-- 		-- vim.g.CoVimToggleOnOpen = 1 -- автоматически включать CoVim при открытии файла
	-- 		vim.g.CoVimLeader = ',' -- установка префикса для команд CoVim
	-- 	end
	-- }


	-- use 'neovim/nvim-lspconfig'
	-- use 'williamboman/nvim-lsp-installer'
	-- use { "williamboman/mason.nvim", run = ":MasonUpdate" }


--[[
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'

	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'

	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'

	use 'onsails/lspkind.nvim'
--]]



	--[[ cmp - lspconfig

	use 'saadparwaiz1/cmp_luasnip'


	use 'L3MON4D3/LuaSnip'
	--]]



	-- use 'purofle/vim-mindustry-logic'
end)

