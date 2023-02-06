local vim = vim

vim.g.coq_settings = { ["auto_start"] = "shut-up"}

local coq_status_ok, coq = pcall(require, "coq")
if not coq_status_ok then
    return
end



