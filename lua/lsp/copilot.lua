local vim = vim

local copilot_status_ok, copilot = pcall(require, 'copilot')
if not copilot_status_ok then
  return
end

copilot.setup {}
