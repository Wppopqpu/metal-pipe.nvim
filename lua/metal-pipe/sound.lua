-- temporarily preserved for backward compabilities
local resolver = require("metal-pipe.assets_path_resolver")
local player = require("metal-pipe.sound_player")

local M = {}
function M.play_metal_pipe_sound()
	local metal_pipe_fp = resolver.get_metal_pipe_sound_path()
	player.player:play_sound(metal_pipe_fp)
end

return M
