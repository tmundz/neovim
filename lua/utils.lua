local M = {}

function M.get_today_tasks()
  -- Return a default minimal response since we don't have the original path config
  local today = os.date '%Y-%m-%d'
  return { 'Tasks for ' .. today .. ' (basic mode)' }
end

-- Keep this empty function to prevent errors from alpha.lua button mapping
function M.show_interactive_tasks()
  -- Minimal implementation - just notify that it's not fully functional
  vim.notify('Task toggling not available in basic mode', vim.log.levels.INFO)
end

-- Keep this for the random note button (though it won't work without config)
function M.open_random_note()
  vim.notify('Random note feature requires full configuration', vim.log.levels.WARN)
end

return M
