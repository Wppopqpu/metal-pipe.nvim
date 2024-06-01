local resolver = require("metal-pipe.assets_path_resolver")
local player = require("metal-pipe.sound_player").player

local M = {}
function M.play_metal_pipe_sound()
	local metal_pipe_fp = resolver.get_metal_pipe_sound_path()
	player:play_sound(metal_pipe_fp)
end

function M.play_sound(path)
	if path == nil then
		M.play_metal_pipe_sound()
		return
	end
	player:play_sound(path)
end

return M
