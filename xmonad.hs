import XMonad
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Hooks.DynamicLog  
import XMonad.Hooks.ManageDocks  
import XMonad.Util.Run  
import System.IO
import XMonad.Util.EZConfig(additionalKeys)
   
myLayouts = tiled ||| Mirror tiled ||| Full  
	where  
    	-- default tiling algorithm partitions the screen into two panes  
     	tiled = Tall nmaster delta ratio  
  
 	-- The default number of windows in the master pane  
     	nmaster = 1  
  
     	-- Default proportion of screen occupied by master pane  
     	ratio = 2/3  
  
     	-- Percent of screen to increment by when resizing panes  
     	delta = 5/100 

-- Define amount and names of workspaces
myWorkspaces = ["1","2","3","4","5","6","7","8","9"]

main = 	do
	xmproc <- spawnPipe "/usr/bin/xmobar /home/clen/.xmobarrc"
	xmonad $ defaultConfig
		{ borderWidth = 1 
		, focusedBorderColor = "#ff0000" -- Red
		, manageHook = manageDocks <+> manageHook defaultConfig
		, layoutHook = avoidStruts $ layoutHook defaultConfig
		, workspaces = myWorkspaces
		, logHook = dynamicLogWithPP xmobarPP
			{ 
			  ppOrder  = \(ws:l:t:_) -> [ws]
			, ppOutput = hPutStrLn xmproc
			, ppTitle  = xmobarColor "blue" "" 
			}
		} `additionalKeys`
 		[ ((0, 0x1008FF12), spawn "amixer set Master toggle"),
 		  ((0, 0x1008FF11), spawn "amixer set Master 2%-"),
 		  ((0, 0x1008FF13), spawn "amixer set Master 2%+")
        	]
   
