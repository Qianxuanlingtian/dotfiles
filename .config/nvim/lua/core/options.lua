-- OPTIONS
--
-- See `:h vim.o`
-- NOTE: You can change these options as you wish!
-- For more options, you can see `:h option-list`
-- To see documentation for an option, you can use `:h 'optionname'`, for example `:h 'number'`
-- (Note the single quotes)

vim.o.number = true -- Show line numbers in a column.

-- Show line numbers relative to where the cursor is.
-- Affects the 'number' option above, see `:h number_relativenumber`.
vim.o.relativenumber = true

-- Sync clipboard between OS and Neovim. Schedule the setting after `UIEnter` because it can
-- increase startup-time. Remove this option if you want your OS clipboard to remain independent.
-- See `:h 'clipboard'`
vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    vim.o.clipboard = 'unnamedplus'
  end,
})

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.cursorline = true -- Highlight the line where the cursor is on.
vim.o.scrolloff = 10 -- Keep this many screen lines above/below the cursor.
vim.o.list = true -- Show <tab> and trailing spaces.

-- If performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s). See `:h 'confirm'`
vim.o.confirm = true


-- ---- 自定义设置 ----
-- 设定tab空格数量
vim.opt.tabstop = 4 -- 一个tab显示4个空格
vim.opt.shiftwidth = 4 -- 自动缩进宽度
vim.opt.softtabstop = 4 -- 按tab/backspace时的空格数
vim.opt.expandtab = false -- 不将tab 转换为空格

-- 防止包裹
vim.o.wrap = false

-- 默认新窗口在右侧和下方
vim.o.splitright = true
vim.o.splitbelow = true

-- 外观
-- 设定终端真彩色
vim.o.termguicolors = true
vim.o.signcolumn = "yes"

-- LSP 诊断：在代码行下方显示完整信息，取代行尾简略提示
vim.diagnostic.config({ virtual_lines = true })
