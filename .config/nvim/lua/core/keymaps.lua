
-- KEYMAPS
--
-- See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`

-- Use <Esc> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')
vim.keymap.set({ 'n' }, '<A-h>', '<C-w>h')
vim.keymap.set({ 'n' }, '<A-j>', '<C-w>j')
vim.keymap.set({ 'n' }, '<A-k>', '<C-w>k')
vim.keymap.set({ 'n' }, '<A-l>', '<C-w>l')

-- ---- 自定义配置 ----
-- -- 插入模式
-- vim.keymap.set("i", "jk", "<ESC>")

-- -- 视觉模式
-- 单行或多行移动
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- -- 正常模式
-- 窗口
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口

-- -- 插件
-- neo-tree
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")

-- LSP 悬浮提示（想看警告的具体信息）
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { desc = "LSP hover" })

-- 查看诊断信息（行内诊断详情）
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Diagnostic float" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

