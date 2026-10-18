
-- AUTOCOMMANDS (EVENT HANDLERS)
--
-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`

-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank()
  end,
})

-- USER COMMANDS: DEFINE CUSTOM COMMANDS
--
-- See `:h nvim_create_user_command()` and `:h user-commands`

-- Create a command `:GitBlameLine` that print the git blame for the current line
vim.api.nvim_create_user_command('GitBlameLine', function()
  local line_number = vim.fn.line('.') -- Get the current line number. See `:h line()`
  local filename = vim.api.nvim_buf_get_name(0)
  print(vim.system({ 'git', 'blame', '-L', line_number .. ',+1', filename }):wait().stdout)
end, { desc = 'Print the git blame for the current line' })

-- 启用语法高亮
-- 选用的nvim-treesitter
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'python', 'lua', 'html', 'css', 'json', 'markdown', 'vim', 'help', 'bash' },
  callback = function()
    -- vim.treesitter.start()                                    -- highlighting
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'     -- folds
    vim.wo.foldmethod = 'expr'
    vim.wo.foldlevel = 99  -- 设置折叠层级，0为全折叠，99或999全展开
  end,
})

-- 将cmdline输出显示在notify中
vim.api.nvim_create_user_command('Notify', function (opts)
	local result = vim.fn.system(opts.args)
	local level = vim.v.shell_error == 0 and "info" or "error"
	vim.notify(result, level, { title = "$" .. opts.args, timeout = 10000 })
end, { nargs = 1, complete = 'shellcmd' })
