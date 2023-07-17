local null_ls_plugin = {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
        local builtins = require("null-ls").builtins
        require("null-ls").setup({
            sources = {
                builtins.code_actions.eslint_d,
                builtins.code_actions.gitsigns,
                builtins.diagnostics.dotenv_linter,
                builtins.diagnostics.eslint_d,
                builtins.diagnostics.flake8,
                builtins.diagnostics.zsh,
                builtins.formatting.autoflake,
                builtins.formatting.autopep8,
                builtins.formatting.eslint_d,
                builtins.formatting.fixjson,
                builtins.formatting.isort,
                builtins.formatting.pg_format,
                builtins.formatting.prettierd.with({
                    filetypes = {
                        "javascript", "javascriptreact", "typescript",
                        "typescriptreact", "vue", "css", "scss", "less", "html",
                        "json", "jsonc", "yaml", "markdown", "markdown.mdx",
                        "graphql", "handlebars", "svelte"
                    }
                }),
                builtins.formatting.rustfmt,
                builtins.formatting.rustywind
            },
            on_attach = function(client, bufnr)
                local lsp_group = vim.api.nvim_create_augroup("LspFormatting", {})
                if not client.supports_method("textDocument/formatting") then
                    return
                end

                vim.api.nvim_clear_autocmds({ group = lsp_group, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = lsp_group,
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ async = false })
                    end
                })
            end
        })
    end
}

local cmp_plugin = {
    "hrsh7th/nvim-cmp",
    dependencies = { "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local select_behaviour = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            sources = { { name = "nvim_lsp" }, { name = "luasnip" } },
            snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp.mapping.select_next_item(select_behaviour),
                ["<S-Tab>"] = cmp.mapping.select_prev_item(select_behaviour),
                ["<Enter>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete()
            })
        })
    end
}

local cmp_nvim_lsp_plugin = {
    "hrsh7th/cmp-nvim-lsp",
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local servers = {
            "cssls", "emmet_ls", "html", "lua_ls", "rust_analyzer", "tailwindcss",
            "tsserver", "vimls", "vls", "pyright", "pylsp", "svelte"
        }

        for _, lsp in ipairs(servers) do
            lspconfig[lsp].setup({ capabilities = capabilities })
        end

        lspconfig.pylsp.setup({
            settings = {
                pylsp = {
                    plugins = {
                        autopep8 = { enabled = true },
                        flake8 = { enabled = true }
                    }
                }
            }
        })
    end
}

return { null_ls_plugin, cmp_plugin, cmp_nvim_lsp_plugin }
