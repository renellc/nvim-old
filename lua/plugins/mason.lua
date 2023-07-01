return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = true
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig"
		},
		opts = {
			ensure_installed = {
				"cssls",
				"eslint",
				"emmet_ls",
				"html",
				"jsonls",
				"tsserver",
				"lua_ls",
				"pyright",
                                "pylsp",
				"rust_analyzer",
				"taplo",
				"tailwindcss",
				"vimls"
			}
		}
	},
}
