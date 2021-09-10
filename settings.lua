dofile("data/scripts/lib/mod_settings.lua")


local mod_id = "starting_perk"
mod_settings_version = 1
mod_settings = {
    {
        id = "perks_spawned",
        ui_name = "Number of perks spawned",
        value_default = 1,
        value_min = 1,
        value_max = 25,
        value_display_formatting = " $0 perks",
        scope = MOD_SETTING_SCOPE_NEW_GAME,
    },
    {
        id = "only_one",
        ui_name = "Only one",
        ui_description = "Despawn the other perks when one is chosen.",
        value_default = true,
        scope = MOD_SETTING_SCOPE_NEW_GAME,
    }
}


function ModSettingsUpdate( init_scope )
	local old_version = mod_settings_get_version( mod_id ) -- This can be used to migrate some settings between mod versions.
	mod_settings_update( mod_id, mod_settings, init_scope )
end

function ModSettingsGuiCount()
	return mod_settings_gui_count( mod_id, mod_settings )
end

function ModSettingsGui( gui, in_main_menu )
	mod_settings_gui( mod_id, mod_settings, gui, in_main_menu )
end
