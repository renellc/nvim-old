return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            local telescope = require("telescope")
            telescope.setup({
                pickers = {
                    find_files = {
                        find_command = {"rg", "--files", "--hidden", "-g", "!.git"}
                    }
                }
            })
            -- setup basic keymaps for telescope
            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
        end
    }
}
