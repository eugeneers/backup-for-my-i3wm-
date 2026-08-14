-- Look and feel configuration

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = {
			top = 5,
			right = 5,
			left = 5,
			bottom = 183,
		},
		
        border_size = 2,
        extend_border_grab_area = 10,
        resize_on_border = true,
        col = {
            active_border = {
                colors = { CACHYLGREEN, CACHYDGREEN },
                angle = 45,
            },
            inactive_border = CACHYGRAY,
        },
    },
	input = {
		kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        -- infamous xset r rate 200 35;
        repeat_rate = 35,
        repeat_delay = 200,

        follow_mouse = 1,
        sensitivity = 0,

        touchpad = {
            natural_scroll = false,
        },
    },

	
    group = {
        col = {
            border_active = CACHYLBLUE,
            border_inactive = CACHYGRAY,
            border_locked_active = CACHYDBLUE,
            border_locked_inactive = CACHYGRAY,
        },
        groupbar = {
            col = {
                active = CACHYLGREEN,
                inactive = CACHYGRAY,
                locked_active = CACHYDBLUE,
                locked_inactive = CACHYGRAY,
            },
        },
    },
    decoration = {
        dim_special = 0.3,
        rounding = 10,
        active_opacity = 1.0,
        inactive_opacity = 0.90,
        fullscreen_opacity = 1,
        blur = {
			enabled = true,
            size = 3,
            passes = 2,
			vibrancy = 0.1696,
            special = true,
        },
    },
})
