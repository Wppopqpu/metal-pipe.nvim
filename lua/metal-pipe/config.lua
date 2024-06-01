--------------------------------- IMPORTS
local g = vim.g

----------------------- MODULE DEFINITION
local M = {}

------------------ PRIVATE IMPLEMENTATION
local defaults = {
  on_buf_focus_change = true,
  on_buffer_write = true,
  on_cursor_movement = false,
}

local function filter_user_options_to_contain_only_valid_keys(user_options)
  local valid_keys = vim.tbl_keys(defaults)

  for key, _ in pairs(user_options) do
    if not vim.tbl_contains(valid_keys, key) then
      print('metal-pipe.nvim: options key `' .. key .. '` is not a valid option')

      user_options[key] = nil
    end
  end
end

local function set_global_variables(options)
  for key, value in pairs(options) do
	-- add prefix
    g["metal_pipe_"..key] = value
  end
end

----------------------- PUBLIC MODULE API
function M.setup(options)
  -- NOTE: Mutates the `options` table
  filter_user_options_to_contain_only_valid_keys(options or {})

  -- Merge the user options with the defaults
  local finalized_options = vim.tbl_extend('force', defaults, options)

  set_global_variables(finalized_options)
end

------------------------------ MODULE END
return M
