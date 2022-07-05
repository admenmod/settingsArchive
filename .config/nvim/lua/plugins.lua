local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
	if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
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
	print("Downloading packer.nvim...")

	return
end


return require('packer').startup(function()
	use { 'wbthomason/packer.nvim', opt = true }

	-- use 'ryanoasis/vim-devicons'
	use 'kyazdani42/nvim-web-devicons'


	use 'Mofiqul/vscode.nvim'
	use 'ap/vim-css-color'
	use 'jrudess/vim-foldtext'

	use 'mbbill/undotree'
	use 'skanehira/translate.vim'
	use 'preservim/tagbar'
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
	use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons' }

	use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim', config = function()
		require('telescope').setup()
	end }

	-- use 'preservim/nerdtree'
	use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons', config = function()
		require('nvim-tree').setup({}) end
	}

	use { 'numToStr/Comment.nvim', config = function()
		require('Comment').setup()
	end }

	use 'honza/vim-snippets'
	use 'SirVer/ultisnips'

	use 'https://tpope.io/vim/fugitive.git'

	use { 'nvim-treesitter/nvim-treesitter', run = 'TSUpdate' }

	use { 'neoclide/coc.nvim', branch = 'release' }


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
end)

