import XMonad
import Data.Monoid
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

import XMonad.Util.SpawnOnce

import XMonad.ManageHook
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks

import XMonad.Layout.Spacing
import XMonad.Layout.Gaps
import XMonad.Layout.NoBorders

defaultTerminal = "alacritty"

borderWidth' = 2
modMask'     = mod4Mask
workspaces'  = ["1","2","3","4","5","6","7","8","9", "10"]

normalBorderColor'  = "#EBCB8B"
focusedBorderColor' = "#BF616A"

keys' conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm,               xK_q     ), kill                          )
    , ((modm,               xK_space ), sendMessage NextLayout        )
    , ((modm .|. shiftMask, xK_space ), sendMessage ToggleStruts      )
    , ((modm,               xK_j     ), windows W.focusDown           )
    , ((modm,               xK_k     ), windows W.focusUp             )
    , ((modm,               xK_m     ), windows W.focusMaster         )
    , ((modm,               xK_i     ), windows W.swapMaster          )
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown            )
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp              )
    , ((modm,               xK_h     ), sendMessage Shrink            )
    , ((modm,               xK_l     ), sendMessage Expand            )
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
    , ((modm .|. shiftMask, xK_r     ), io $ spawn "xmonadr.sh"       )
    , ((modm .|. shiftMask, xK_q     ), io $ exitWith ExitSuccess     )
    ]

    ++

    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) ([xK_1 .. xK_9] ++ [xK_0])
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

    ++

    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_a, xK_s] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


mouseBindings' (XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
    ]

layout' = tiledLayout ||| noBorders Full

tiledLayout = outerGaps $ innerGaps $ Tall nmaster delta ratio
  where
     gapsSize   = 6
     outerGaps  = gaps $ map (\x -> (x, gapsSize)) [U, D, L, R]
     innerGaps  = spacing gapsSize
     nmaster    = 1
     ratio      = 1/2
     delta      = 3/100

manageHook' = (composeAll . concat $
    [ [className =? c --> doShift "3"   | c <- ["firefox", "Chromium"]]
    , [className =? c --> doShift "4"   | c <- ["TelegramDesktop"]]
    , [className =? c --> doCenterFloat | c <- ["Indicator-kdeconnect",
                                                "Sms.py"]]
    ])

eventHook' = mempty

startupHook' = spawnOnce "$HOME/.config/scripts/start_programs.sh"

main = xmonad $ docks $ ewmh defaults

defaults = def {
        terminal           = defaultTerminal,
        focusFollowsMouse  = True,
        clickJustFocuses   = False,
        borderWidth        = borderWidth',
        modMask            = modMask',
        workspaces         = workspaces',
        normalBorderColor  = normalBorderColor',
        focusedBorderColor = focusedBorderColor',

        keys               = keys',
        mouseBindings      = mouseBindings',

        layoutHook         = avoidStruts $ layout',
        manageHook         = manageHook',
        handleEventHook    = eventHook',
        startupHook        = startupHook'
    }

