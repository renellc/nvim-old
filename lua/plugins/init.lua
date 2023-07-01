return {
	"nvim-tree/nvim-web-devicons",
        "lewis6991/gitsigns.nvim",
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local onedark = require("onedark")
			onedark.setup({ style = "deep" })
			onedark.load()
		end
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				show_end_of_line = true,
				show_current_context = true,
				show_current_context_start = true
			})
		end
	},
        {
            "glepnir/lspsaga.nvim",
            event = "LspAttach",
            config = function() require("lspsaga").setup({}) end,
            dependencies = {"nvim-tree/nvim-web-devicons"}
        },
        {
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            opts = {}
        },
        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v2.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons",
                "MunifTanjim/nui.nvim"
            },
            config = function ()
                vim.keymap.set("n", "<leader>fb", ":Neotree toggle<CR>")
            end
        }
}
