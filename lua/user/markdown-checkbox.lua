-- user/markdown-checkbox.lua
--
-- Toggle markdown checkboxes: [ ] -> [x] -> [>] -> [ ]

local M = {}

local states = { "[ ]", "[x]", "[>]" }

local function next_state(current)
  for i, state in ipairs(states) do
    if state == current then
      return states[(i % #states) + 1]
    end
  end
  return states[1]
end

function M.toggle()
  local line = vim.api.nvim_get_current_line()
  local s, e = line:find("%[[ x>]%]")
  if not s then return end

  local current = line:sub(s, e)
  local new_line = line:sub(1, s - 1) .. next_state(current) .. line:sub(e + 1)
  vim.api.nvim_set_current_line(new_line)
end

return M
