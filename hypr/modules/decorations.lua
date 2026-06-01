require("colors")   -- matugen colors

-----------------------
---- LOOK AND FEEL ----
-----------------------
hl.config({
    general = {
        gaps_in         = 3,
        gaps_out        = 5,
        border_size     = 1,
        col = {
            active_border   = { colors = { primary, secondary }, angle = 45 },
            inactive_border = surface,
        },
        resize_on_border = false,
        allow_tearing    = false,
        layout           = "dwindle",
     },


    decoration = {
        rounding       = 0,
        rounding_power = 0,
        active_opacity   = 0.92,
        inactive_opacity = 0.88,
        dim_inactive   = true,
        dim_strength   = 0.08,
        dim_special    = 0.4,
        shadow = {
            enabled      = false,
            range        = 0,
            render_power = 1,
            color        = background,
        },
        blur = {
            enabled          = true,
            size             = 5,
            passes           = 2,
            contrast         = 1.5,
            brightness       = 0.8,
	    new_optimizations = true,
            vibrancy         = 0,
            vibrancy_darkness = 0,
        },
    },

    animations = {
        enabled = true,
    },
})

--------------------
---- ANIMATIONS ----
--------------------
hl.curve("snap",       { type = "bezier", points = { {0.19, 1}, {0.22, 1} } })
hl.curve("smooth",     { type = "bezier", points = { {0.4, 0},  {0.2, 1}  } })
hl.curve("snappyOut",  { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })
hl.curve("linear",     { type = "bezier", points = { {0, 0},    {1, 1}    } })

hl.animation({ leaf = "windows",          enabled = true, speed = 4,   bezier = "snap",      style = "slide" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 4,   bezier = "snap",      style = "slide" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 3,   bezier = "snappyOut", style = "slide" })
hl.animation({ leaf = "border",           enabled = true, speed = 6,   bezier = "smooth" })
hl.animation({ leaf = "fade",             enabled = true, speed = 4,   bezier = "smooth" })
hl.animation({ leaf = "fadeIn",           enabled = true, speed = 3,   bezier = "smooth" })
hl.animation({ leaf = "fadeOut",          enabled = true, speed = 2.5, bezier = "smooth" })
hl.animation({ leaf = "layers",           enabled = true, speed = 3,   bezier = "snap",      style = "slide" })
hl.animation({ leaf = "layersIn",         enabled = true, speed = 3,   bezier = "snap",      style = "fade"  })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 2,   bezier = "linear",    style = "fade"  })
hl.animation({ leaf = "workspaces",       enabled = true, speed = 4,   bezier = "snap",      style = "slide" })
hl.animation({ leaf = "workspacesIn",     enabled = true, speed = 4,   bezier = "snap",      style = "slide" })
hl.animation({ leaf = "workspacesOut",    enabled = true, speed = 3,   bezier = "snappyOut", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 4,   bezier = "snap",      style = "slidevert" })