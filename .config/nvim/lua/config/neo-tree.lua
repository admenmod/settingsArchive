-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd [[let g:neo_tree_remove_legacy_commands = 1]]

vim.cmd [[
" let g:neotree_auto_open=1
" let g:neotree_auto_close=1
" let g:neotree_quit_on_open=1
" let g:neotree_hide_dotfiles=1
" let g:neotree_hide_dotfiles_patterns=['\.git$', '\.hg$', '\.svn$', '\.DS_Store$']
" let g:neotree_ignore=['README.md', '\.DS_Store']
" let g:neotree_window_width=30
" let g:neotree_respect_buf_cwd=1

" autocmd FileType netrw Neotree
]]


local function read_symlink(path)
	local f = io.open(path, 'r')

	dump(f)

	if not f then
		return nil, 'Error opening file: '..path
	end

	local target = f:read('*a')
	f:close()

	return target
end

local neotree = require('neo-tree')

neotree.setup({
	--[[
	filesystem = {
		components = {
			name = function(config, node)
				local text = ''

				if node.is_link then dump(node) end

				if node.is_link then
					print(node.path)
					print(read_symlink(node.path))
					text = node.name..' -> '..read_symlink(node.path)
				elseif true then
					text = node.name
				end

				return { 
					text = text,
					highlight = 'auto'
				}
			end

		}
	}
	]]
})
