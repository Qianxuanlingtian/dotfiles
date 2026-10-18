-- 语言支持协议（LSP：Language Support Protocol）管理工具
return {
	{
		"mason-org/mason.nvim",
		cmd = "Mason",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				}
			}
		}
	},
	{
		-- mason-lspconfig为mason.nvim扩展，方便连接mason与nvim-lspconfig
		"mason-org/mason-lspconfig.nvim",
		event = "VeryLazy",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = { "lua_ls", "pylsp", "html", "cssls", "jsonls", "bashls", "vimls" },
			handlers = {
				-- 默认 handler：自动为所有安装的服务器调用 lspconfig.setup
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
			}
		}
	}
}
