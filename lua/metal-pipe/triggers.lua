--------------------------------- IMPORTS
local api = vim.api

local autocmd = api.nvim_create_autocmd
local augroup = api.nvim_create_augroup

local g = vim.g

local play_sound = require("metal-pipe.sound").play_sound

----------------------- MODULE DEFINITION
local M = {}

------------------ PRIVATE IMPLEMENTATION
local function fn_wrapper(order)
	return function()
		-- check whether it is diabled
		if g.metal_pipe_disabled then
			return
		end
		if order == true then
			play_sound()
		elseif type(order) == "string" then
			play_sound(order)
		else
			assert(order==false, "[metal-pipe.nvim]:invalid option value `"..condition.."`.")

		end
  
	end
end

autocmd({ 'BufLeave', 'CmdlineLeave' }, {
  group = augroup('MetalPipeSoundOnBufferFocusChange', { clear = true }),
  pattern = { '*' },
  callback = fn_wrapper(g.metal_pipe_on_buf_focus_change),
  desc = 'Play metal pipe sound on buffer focus changes',
})

autocmd({ 'BufWrite' }, {
  group = augroup('MetalPipeSoundOnBufferWrite', { clear = true }),
  pattern = { '*' },
  callback = fn_wrapper(g.metal_pipe_on_buffer_write),
  desc = 'Play metal pipe sound on buffer writes',
})

autocmd({ 'CursorMoved', 'CursorMovedI', 'CmdlineChanged' }, {
  group = augroup('MetalPipeSoundOnCursorMovements', { clear = true }),
  pattern = { '*' },
  callback = fn_wrapper(g.metal_pipe_on_cursor_movement),
  desc = 'Play metal pipe sound on cursor movements',
})

----------------------- PUBLIC MODULE API
function M.toggle(order)
	if type(order) == "boolean" then
		g.metal_pipe_disabled = order
		return
	end
	assert(order==nil)
	if g.metal_pipe_disabled == true then
		g.metal_pipe_disabled = false
	else
		g.metal_pipe_disabled = true
	end
end
------------------------------ MODULE END
return M
