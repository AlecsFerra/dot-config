if [ $XDG_SESSION_TYPE = "wayland" ]; then
  export GDK_BACKEND=wayland
  export MOZ_ENABLE_WAYALND=1
fi
