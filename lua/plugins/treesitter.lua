return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function ()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				ensure_installed = {
					"css",
					"html",
					"javascript",
					"jsdoc",
					"json",
					"lua",
					"python",
					"rust",
					"scss",
                                        "svelte",
					"tsx",
					"typescript",
					"vim"
				},
				highlight = {
					enable = true
				}
			})
		end
	}
}
