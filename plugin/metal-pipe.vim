" Prevents the plugin from being loaded multiple times. If the loaded
" variable exists, do nothing more. Otherwise, assign the loaded
" variable and continue running this instance of the plugin.
if exists("g:loaded_metalpipeplugin")
    finish
endif
let g:loaded_metalpipeplugin = 1

" Exposes the plugin's functions for use as commands in Neovim.
command! -nargs=1 MetalPipePlayFile lua require("metal-pipe").play_sound(<f-args>)
command! -nargs=0 MetalPipePlay lua require("metal-pipe").play_metal_pipe_sound()
command! -nargs=0 MetalPipeToggle lua require("metal-pipe").toggle()
