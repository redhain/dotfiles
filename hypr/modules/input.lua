---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",
        sensitivity   = 0.8,
        follow_mouse  = 1,
        accel_profile = "flat",
        mouse_refocus = false,
    },
    cursor = {
        no_hardware_cursors = true, -- was true, but false is better on AMD/radeonsi
    },
})

-- Per-device config
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})
