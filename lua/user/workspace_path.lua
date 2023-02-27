local M = {};
local home = os.getenv "HOME"

M.get_current_path = function()
  local git_module_path = require('jdtls.setup').find_root({ '.git' })

  local workspace_folder

  if (git_module_path ~= nil)
  then
    workspace_folder = home .. "/.local/share/eclipse" .. git_module_path
  else
    workspace_folder = home .. "/.local/share/eclipse/diffview/"
  end
  return workspace_folder;
end

M.sep = '/'

local function join(...)
  return table.concat(vim.tbl_flatten {...}, '/'):gsub('/' .. '+', '/')
end


-- stolen from nvim jdtls
M.get_git_root = function()
  return require('jdtls.setup').find_root({ '.git' })
end

return M;
