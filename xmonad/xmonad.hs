{-# LANGUAGE TupleSections #-}

import Colors
import Data.Char
import qualified Data.Map as M
import Data.Monoid
import System.Exit
import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Hooks.WindowSwallowing
import XMonad.Layout.Accordion
import XMonad.Layout.Gaps
import XMonad.Layout.NoBorders
import XMonad.Layout.ShowWName
import XMonad.Layout.Spacing
import XMonad.ManageHook
import qualified XMonad.StackSet as W
import XMonad.Util.SpawnOnce
import qualified XMonad.Util.Hacks as Hacks
import XMonad.Hooks.ManageHelpers

defaultTerminal = "alacritty"

borderWidth' = 3

modMask' = mod4Mask

workspaces' = ["main", "code", "web", "chat", "5", "6", "7", "8", "9", "10"]

normalBorderColor' = color2

focusedBorderColor' = color1

keys' conf@XConfig {XMonad.modMask = modm} =
  M.fromList $
    [ ((modm, xK_q), kill),
      ((modm .|. shiftMask, xK_space), sendMessage ToggleStruts),
      ((modm, xK_space), sendMessage NextLayout),
      ((modm, xK_j), windows W.focusDown),
      ((modm, xK_k), windows W.focusUp),
      ((modm, xK_m), windows W.focusMaster),
      ((modm, xK_i), windows W.swapMaster),
      ((modm .|. shiftMask, xK_j), windows W.swapDown),
      ((modm .|. shiftMask, xK_k), windows W.swapUp),
      ((modm, xK_h), sendMessage Shrink),
      ((modm, xK_l), sendMessage Expand),
      ((modm, xK_t), withFocused $ windows . W.sink)
    ]
      ++ moveWindow
      ++ changeWS
  where
    moveWindow =
      [ ((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) ([xK_1 .. xK_9] ++ [xK_0]),
          (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
      ]
    changeWS =
      [ ((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_s, xK_a] [0 ..],
          (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
      ]

mouseBindings' XConfig {XMonad.modMask = modm} =
  M.fromList
    [ ( (modm, button1),
        \w -> focus w >> mouseMoveWindow w >> windows W.shiftMaster
      ),
      ( (modm, button2),
        \w -> focus w >> windows W.shiftMaster
      ),
      ( (modm, button3),
        \w -> focus w >> mouseResizeWindow w >> windows W.shiftMaster
      )
    ]

layout' =
  smartBorders $
    tiledLayout
      ||| makeGaps Accordion
      ||| Mirror tiledLayout
      ||| noBorders Full

makeGaps = outerGaps . innerGaps
  where
    gapsSize = 5
    innerGaps = spacing gapsSize
    outerGaps = gaps $ map (,gapsSize) [U, L, R, D]
    --outerGaps = gaps $ (L, 18) : (map (,gapsSize) [U, R, D])

tiledLayout = makeGaps $ Tall nmaster delta ratio
  where
    nmaster = 1
    ratio = 3 / 5
    delta = 1 / 100

chatApplications = ["TelegramDesktop", "discord", "Element", "Hexchat"]

browsers = ["firefox", "LibreWolf", "Chromium"]

floating = ["Indicator-kdeconnect", "Sms.py", "zoom"]

windowrules =
  composeAll . concat $
    [ [ className =? c --> doShift (workspaces' !! 2) | c <- browsers         ],
      [ className =? c --> doShift (workspaces' !! 3) | c <- chatApplications ],
      [ className =? c --> doCenterFloat              | c <- floating         ],

      [ appName ^? "floating-" --> doFloat ]
    ]
    

showNameTheme :: SWNConfig
showNameTheme = SWNC "xft:Ubuntu:bold:size=30" background foreground 1.0

swallowHook = swallowEventHook (className =? "Alacritty") (return True)

eventHook' = Hacks.windowedFullscreenFixEventHook <> swallowHook 

startupHook' = do
  spawnOnce "$HOME/.config/scripts/start_programs.sh"
  setWMName "AlecsMonad 0.420.69-beta"

layoutHook' = showWName' showNameTheme $ avoidStruts layout'

main = xmonad $ docks $ ewmh defaults

defaults =
  def
    { terminal = defaultTerminal,
      focusFollowsMouse = True,
      clickJustFocuses = False,
      borderWidth = borderWidth',
      modMask = modMask',
      workspaces = workspaces',
      normalBorderColor = normalBorderColor',
      focusedBorderColor = focusedBorderColor',
      keys = keys',
      mouseBindings = mouseBindings',
      layoutHook = layoutHook',
      manageHook = windowrules,
      handleEventHook = eventHook',
      startupHook = startupHook'
    }
