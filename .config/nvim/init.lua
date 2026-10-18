-- Set <space> as the leader key
-- See `:h mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '

require("core.options") -- 启用各类设置
require("core.keymaps") -- 启用各类快捷键

require("core.lazy") -- 启用lazy.nvim管理的各类插件
require("core.commands") -- 启用各类命令，包含触发式及自动命令

-- 启用主题，切记在主题插件启用后再启用主题
vim.cmd[[colorscheme tokyonight]]
