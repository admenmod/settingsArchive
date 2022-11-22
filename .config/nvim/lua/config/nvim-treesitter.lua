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
