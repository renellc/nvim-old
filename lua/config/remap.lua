-- Keymaps for LSP
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local opts = { buffer = args.bug, remap = false }
        vim.keymap.set("n", "<F1>", "<cmd>Lspsaga code_action<CR>", opts)
        vim.keymap.set("n", "<F2>", "<cmd>Lspsaga rename ++project<CR>", opts)
    end
})
