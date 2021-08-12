dofile( "data/scripts/perks/perk.lua" )


function OnPlayerSpawned( player_entity )

	-- Run this only once per game
	local init_check_flag = "starting_perk_init_done"
	if GameHasFlagRun( init_check_flag ) then
		return
	end
	GameAddFlagRun( init_check_flag )

	-- Spawn a perk below the 1..2 wall
	perk_spawn_random( 771, -96 )

	-- Used to take the screenshot
	-- perk_spawn( 771, -96, "GENOME_MORE_LOVE" )
end
