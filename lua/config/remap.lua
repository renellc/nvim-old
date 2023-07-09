-- Keymaps for LSP
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local opts = { buffer = args.bug, remap = false }
        vim.keymap.set("n", "<F1>", "<cmd>Lspsaga code_action<CR>", opts)
        vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

        vim.keymap.set("n", "<leader>jdf", vim.lsp.buf.definition, opts);
        vim.keymap.set("n", "<leader>jdc", vim.lsp.buf.declaration, opts);

        vim.keymap.set("n", "<leader>r", vim.lsp.buf.references, opts);
    end
})
