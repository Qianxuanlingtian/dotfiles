-- Tokyonight 主题插件，默认是tokyonight-moon，还有tokyonight-storm，tokyonight-night，tokyonight-day
return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		transparent = true,
		terminal_colors = true,
		styles = {
			sidebars = "transparent",
			floats = "transparent"
		}
	}
}
