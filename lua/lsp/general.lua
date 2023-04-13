local vim = vim

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = false,
  --virtual_text = true;
  severity_sort = true,
  float = {
    source = "always",  -- Or "if_many"
  },
  signs = true,
  update_in_insert = true,
  underline = true,
})

