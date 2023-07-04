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
            opts = {
            },
            config = function ()
                require("neo-tree").setup({
                    filesystem = {
                        follow_current_file = true,
                        filtered_items = {
                            visible = true,
                            show_hidden_count = true,
                            hide_dotfiles = false,
                            hide_by_name = {
                                ".git",
                                ".DS_STORE",
                                "node_modules",
                            },
                            never_show = {
                                "node_modules"
                            }
                        }
                    }
                })

                vim.keymap.set("n", "\\ss", ":Neotree toggle<CR>")
            end
        },
        {
            "stevearc/dressing.nvim",
            opts = {},
        },
        {
            "folke/trouble.nvim",
            dependencies = { "nvim-tree/nvim-web-devicons" },
            opts = {},
            config = function()
                vim.keymap.set("n", "<leader>ds", "<cmd>TroubleToggle<CR>", {silent=true, noremap=true})
            end
        }
}
