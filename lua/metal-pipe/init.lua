--------------------------------- IMPORTS
local sound = require("metal-pipe.sound")
local triggers = require 'metal-pipe.triggers'
local config = require 'metal-pipe.config'

----------------------- MODULE DEFINITION
-- Top-level plugin's module object.
local M = {}

------------------- PLUGIN API DEFINITION

-- Plays the sound file found a the give path.
---@param path string # Path to a sound file.
M.play_sound = sound.play_sound

-- Plays the greates sound to ever exist.
M.play_metal_pipe_sound = sound.play_metal_pipe_sound
M.toggle = triggers.toggle
M.setup = config.setup

------------------------------ MODULE END
return M
