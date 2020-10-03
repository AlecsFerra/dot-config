import XMonad
import Data.Monoid
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

-- To Spawn only one the start program
import XMonad.Util.SpawnOnce

import XMonad.Hooks.ManageDocks

import XMonad.ManageHook
import XMonad.Hooks.ManageHelpers

import XMonad.Hooks.EwmhDesktops

import XMonad.Layout.Spacing

defaultTerminal = "alacritty"

borderWidth' = 2
modMask'     = mod4Mask
workspaces'  = ["1","2","3","4","5","6","7","8","9", "10"]

normalBorderColor'  = "#839aec"
focusedBorderColor' = "#70b791"

keys' conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    [ ((modm,               xK_q     ), kill)

     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )

    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window and the master window
    , ((modm,               xK_i), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)

    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)

    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) ([xK_1 .. xK_9] ++ [xK_0])
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{a,s}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{a,s}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_a, xK_s] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


mouseBindings' (XConfig {XMonad.modMask = modm}) = M.fromList $
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))
    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
    ]

layout' = tiled ||| Mirror tiled ||| Full
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = spacing 3 $ Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

manageHook' = (composeAll . concat $
    [ [className =? c --> doShift "3"   | c <- ["Firefox", "Chromium"]]
    , [className =? c --> doShift "4"   | c <- ["Telegram"]]
    , [className =? c --> doCenterFloat | c <- ["Indicator-kdeconnect"]]
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

