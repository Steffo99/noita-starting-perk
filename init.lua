dofile("data/scripts/perks/perk.lua")
dofile("data/scripts/lib/utilities.lua")
dofile("data/scripts/lib/mod_settings.lua")


function OnPlayerSpawned( player_entity )

	-- Run this only once per game
	local init_check_flag = "veggies_init_done"
	if GameHasFlagRun( init_check_flag ) then
		return
	end
	GameAddFlagRun( init_check_flag )

	-- Print mod settings to the player
	GamePrint("Starting with the Eat Your Vegetables perk")

	-- Spawn the actual perk
	local perk_entity = perk_spawn( 771, -96, "FOOD_CLOCK" )

	-- Give the perk to the player
	perk_pickup( perk_entity, player_entity, EntityGetName( perk_entity ), false, false )
end
