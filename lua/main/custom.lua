local vim = vim;

local neo_tree_manager_status_ok, neo_tree_manager = pcall(require, "neo-tree.sources.manager")
if not neo_tree_manager_status_ok then
    return
end

vim.api.nvim_create_user_command("CopyRootPath", function()
  local path = neo_tree_manager.get_state("filesystem").path
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})
