-- 语法高亮插件
return {
	'nvim-treesitter/nvim-treesitter',
	-- dependencies = { 'neovim-treesitter/treesitter-parser-registry' },
	branch = 'main',
	lazy = false,
	event = { "BufReadPost", "BufNewFile" },
	build = ':TSUpdate',
	config = function()
		require('nvim-treesitter').install({
			'python', 'lua', 'html', 'css', 'json', 'markdown' , 'vim', 'help', 'bash'
		})
	end,
}
