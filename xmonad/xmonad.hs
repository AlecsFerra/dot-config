{-# LANGUAGE TupleSections #-}
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

import Colors

defaultTerminal = "alacritty"

borderWidth' = 2
modMask'     = mod4Mask
workspaces'  = ["1","2","3","4","5","6","7","8","9", "10"]

normalBorderColor'  = color2
focusedBorderColor' = color1

keys' conf@XConfig {XMonad.modMask = modm} = M.fromList $
    [ ((modm,               xK_q     ), kill                          )
    , ((modm .|. shiftMask, xK_space ), sendMessage NextLayout        )
    , ((modm,               xK_space ), sendMessage ToggleStruts      )
    , ((modm,               xK_j     ), windows W.focusDown           )
    , ((modm,               xK_k     ), windows W.focusUp             )
    , ((modm,               xK_m     ), windows W.focusMaster         )
    , ((modm,               xK_i     ), windows W.swapMaster          )
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown            )
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp              )
    , ((modm,               xK_h     ), sendMessage Shrink            )
    , ((modm,               xK_l     ), sendMessage Expand            )
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
    ]

    ++

    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) ([xK_1 .. xK_9] ++ [xK_0])
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

    ++

    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_s, xK_a] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


mouseBindings' XConfig {XMonad.modMask = modm} = M.fromList 
    [ ((modm, button1), \w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster)
    , ((modm, button2), \w -> focus w >> windows W.shiftMaster)
    , ((modm, button3), \w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster)
    ]

layout' = tiledLayout ||| noBorders Full

tiledLayout = outerGaps $ innerGaps $ Tall nmaster delta ratio
  where
     gapsSize   = 5
     outerGaps  = gaps $ map (, gapsSize) [U, L, R, D]
     innerGaps  = spacing gapsSize
     nmaster    = 1
     ratio      = 1/3
     delta      = 3/100

windowrules = composeAll . concat $
    [ [className =? c --> doShift "3"   | c <- ["firefox", "Chromium"]]
    , [className =? c --> doShift "4"   | c <- ["TelegramDesktop"]]
    , [className =? c --> doShift "5"   | c <- ["zoom"]]
    , [className =? c --> doCenterFloat | c <- ["Indicator-kdeconnect",
                                                "Sms.py",
                                                "zoom",
                                                "Pavucontrol"]]
    ] 

eventHook' = fullscreenEventHook

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

        layoutHook         = avoidStruts layout',
        manageHook         = windowrules, 
        handleEventHook    = eventHook',
        startupHook        = startupHook'
    }

