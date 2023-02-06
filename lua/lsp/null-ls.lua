local vim = vim;

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local formatting = null_ls.builtins.formatting

null_ls.setup {
    on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_command [[augroup Format]]
            vim.api.nvim_command [[autocmd! * <buffer>]]
            vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
            vim.api.nvim_command [[augroup END]]
        end
    end,
    sources = {
        formatting.prettier
        -- null_ls.builtins.diagnostics.eslint_d.with({
        --     diagnostics_format = '[eslint] #{m}\n(#{c})'
        -- }),
        -- null_ls.builtins.diagnostics.fish
    }
}
