local vim = vim

require("mason").setup()
require("mason-lspconfig").setup()


local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())


local default_on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    require("which-key").register({
        ["<leader>d"] = { name = "+diagnostics" },
        ["<leader>de"] = { vim.diagnostic.open_float, "Diagnostics open_float"},
        ["<leader>ds"] = { vim.diagnostic.show, "Diagnostics show"},
        ["<leader>dp"] = { vim.diagnostic.goto_prev, "Diagnostics goto_prev"},
        ["<leader>dn"] = { vim.diagnostic.goto_next, "Diagnostics goto_next"},
        ["<leader>dd"] = { "<cmd>Telescope diagnostics<CR>", "Diagnostics telescope"},

        ["<leader>l"] = { name = "+lsp" },
        ["<leader>la"] = { vim.lsp.buf.code_action, "LSP Code Action"},
        ["<leader>li"] = { require("telescope.builtin").lsp_implementations, "LSP Implementation"},
        ["<leader>lf"] = { vim.lsp.buf.formatting, "LSP Formatting"},
        ["<leader>lrf"] = { require("telescope.builtin").lsp_references, "LSP References"},
        ["<leader>ld"] = { require("telescope.builtin").lsp_definitions, "LSP Definition"},
        ["<leader>lrn"] = { vim.lsp.buf.rename, "LSP Rename"},

        ["<leader>lh"] = { name = "+hover" },
        ["<leader>lhh"] = { require("hover").hover, "Lsp Hover" },
        ["<leader>lhs"] = { require("hover").hover_select, "Lsp Hover Select" },
    }, { noremap=true, silent=true, buffer=bufnr })

end



require("mason-lspconfig").setup_handlers({

    -- Default handler for all not manually configured lsp configs
    function (server_name)
        require("lspconfig")[server_name].setup {
            capabilities = capabilities,
            on_attach = default_on_attach,
        }
    end,


    ["rust_analyzer"] = function()
        require("rust-tools").setup {
            server = {
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    default_on_attach(client, bufnr)

                    require("which-key").register({
                        ["<leader>r"] = { name = "+rust-tools" },
                        ["<leader>rrr"] = { "<cmd>RustRunnables<CR>", "Rust Runnables"},
                        ["<leader>rca"] = { "<cmd>RustCodeAction<CR>", "Rust Code Action"},
                        ["<leader>rdd"] = { "<cmd>RustDebuggables<CR>", "Rust Debuggables"},
                        ["<leader>rdih"] = { "<cmd>RustDisableInlayHints<CR>", "Rust Disable Inlay Hints"},
                        ["<leader>reih"] = { "<cmd>RustEnableInlayHints<CR>", "Rust Enable Inlay Hints"},
                        ["<leader>rem"] = { "<cmd>RustExpandMacro<CR>", "Rust Expand Macro"},
                        ["<leader>rha"] = { "<cmd>RustHoverActions<CR>", "Rust Hover Actions"},
                        ["<leader>rhr"] = { "<cmd>RustHoverRange<CR>", "Rust Hover Range"},
                        ["<leader>rjl"] = { "<cmd>RustJoinLines<CR>", "Rust Join Lines"},
                        ["<leader>rmid"] = { "<cmd>RustMoveItemDown<CR>", "Rust Move Item Down"},
                        ["<leader>rmiu"] = { "<cmd>RustMoveItemUp<CR>", "Rust Move Item Up"},
                        ["<leader>roc"] = { "<cmd>RustOpenCargo<CR>", "Rust Open Cargo"},
                        ["<leader>roed"] = { "<cmd>RustOpenExternalDocs<CR>", "Rust Open External Docs"},
                        ["<leader>rpm"] = { "<cmd>RustParentModule<CR>", "Rust Parent Module"},
                        ["<leader>rpp"] = { "<cmd>RustPlay<CR>", "Rust Play"},
                        ["<leader>rrp"] = { "<cmd>RustReloadWorkspace<CR>", "Rust Reload Workspace"},
                        ["<leader>rssr"] = { "<cmd>RustSSR<CR>", "Rust SSR"},
                        ["<leader>rsih"] = { "<cmd>RustSetInlayHint<CR>", "Rust Set Inlay Hints"},
                        ["<leader>rsssfb"] = { "<cmd>RustStartStandaloneServerForBuffer<CR>", "Rust Start Standalone Server For Buffer"},
                        ["<leader>ruih"] = { "<cmd>RustUnsetInlayHints<CR>", "Rust Unset Inlay Hints"},
                        ["<leader>rvcg"] = { "<cmd>RustViewCrateGraph<CR>", "Rust View Crate Graph"},
                    }, { noremap=true, silent=true, buffer=bufnr })
                end,
            },
        }
    end,
})
