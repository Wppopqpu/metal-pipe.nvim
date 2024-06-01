--------------------------------- IMPORTS
local assets_resolver = require("metal-pipe.assets_path_resolver")
local sound_player = require("metal-pipe.sound_player")
local triggers = require 'metal-pipe.triggers'
local config = require 'metal-pipe.config'

----------------------- MODULE DEFINITION
-- Top-level plugin's module object.
local M = {}

------------------- PLUGIN API DEFINITION

-- Plays the sound file found a the give path.
---@param path string # Path to a sound file.
function M.play_sound(path)
	if path == nil then
		M.play_metal_pipe_sound()
		return
	end
	sound_player.player:play_sound(path)
end

-- Plays the greates sound to ever exist.
function M.play_metal_pipe_sound()
  local metal_pipe_fp = assets_resolver.get_metal_pipe_sound_path()

  sound_player.player:play_sound(metal_pipe_fp)
end
M.toggle_metal_pipe_sound_on_buffer_focus_change =
  triggers.toggle_metal_pipe_sound_on_buffer_focus_change
M.toggle_metal_pipe_sound_on_buffer_write = triggers.toggle_metal_pipe_sound_on_buffer_write
M.toggle_metal_pipe_sound_on_cursor_movement = triggers.toggle_metal_pipe_sound_on_cursor_movement
M.setup = config.setup

------------------------------ MODULE END
return M
