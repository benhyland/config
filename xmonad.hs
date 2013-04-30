import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
import XMonad.Layout.LayoutModifier
import XMonad.Hooks.ManageDocks

main = myIOConfig >>= xmonad

myIOConfig = myLeftDzen (myConfig `additionalKeys` myKeys) >>= myRightDzen

myConfig = defaultConfig
	{
	terminal		= "urxvt",
	workspaces		= myWorkspaces,
	modMask			= myModMask,
	borderWidth		= 2,
	normalBorderColor	= myMainColour,
	focusedBorderColor	= myHighlightColour
	}

myWorkspaces = ["1", "2", "3", "4", "5", "6"]

myModMask = mod1Mask

myKeys :: [((ButtonMask, KeySym), X ())]
myKeys = [
	((myModMask .|. shiftMask,	xK_l		), spawn "slock"),
	((0,				xK_Print	), spawn "scrot -e 'mv $f ~/screenshots/'"),
	((myModMask,			xK_q		), spawn "killall dzen2 && killall -9 conky && xmonad --recompile && xmonad --restart")
	 ]

myMainColour = "#324c80"
myHighlightColour = "#f06f06"

toggleStatusKey :: XConfig t -> (KeyMask, KeySym)
toggleStatusKey conf = (myModMask, xK_b)

dzenBaseCommand = "dzen2 -e 'onstart=lower' -fg black -bg '" ++ myMainColour ++ "'"

myDzenPP = dzenPP
	{
	ppLayout	= const " ",
	ppCurrent	= dzenColor "white" myHighlightColour . pad,
	ppTitle		= dzenColor "#aaaaaa" myMainColour . dzenEscape
	}

myLeftDzen conf = statusBar (dzenBaseCommand ++ " -ta l -x 0 -w 500")  myDzenPP toggleStatusKey conf
myRightDzen conf = statusBar ("conky -c ~/.conkyrc | " ++ dzenBaseCommand ++ " -ta r -x 500 -w 524") defaultPP toggleStatusKey conf
