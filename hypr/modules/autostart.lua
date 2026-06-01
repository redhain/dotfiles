-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:


hl.on("hyprland.start", function()
    hl.exec_cmd("waybar & awww-daemon") --#region Waybar and Awww-daemon
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")  --#this one polkit agent
    hl.exec_cmd("swaync")  -- Uncomment if you want notification daemon


end)